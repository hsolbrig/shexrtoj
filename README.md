# ShExR to ShExC/ShExJ experiments
This project contains a number of experiments on the conversion of ShEx RDF format back to ShExJ and ShExC.  

_Note on naming:_ We use the `".json"` suffix to identify plain JSON as well as compacted JSON-LD.  The `".jsonld"`
suffix identifies _expanded_ JSON-LD (i.e. the JSON-LD representation of RDF), and `".context.jsonld"` for context files.

## Project status and notes
1) The "danbri RDF" that can be found at https://gist.github.com/danbri/43eb914d29a2fd628f0d81868bd0447e will not parse in rdflib 5.0.0
out of the Box.  We have removed the `patterns` to resolve this issue.  (Edits at data/danbri/danbri.ttl)
2) The danbri RDF has several situations where there are shapeAnd's and other structures where the ShEx specification requires
two or more members.  We've created a temporary branch of the ShExJSG parser - `no_min_sizes` - to address this issue.
3) For reasons we have yet to figure out, several of the `shex:` namespaced entities aren't handled correctly in the framing.
There are a couple of other tweaks -- an excerpt from `shexjtoshexc.py` has them here:
```python
def tweak_shexj(shexj: Union[Dict, List, str]) -> Union[Dict, List, str]:
    """ Tweak the ShExJ removing JSON-LD artifacts """
    if isinstance(shexj, dict):
        if len(shexj) == 1 and '@list' in shexj:
            # Convert "key": { "@list": [...] } to "key": [...]
            return [tweak_shexj(v) for v in shexj['@list']]
        elif '@graph' in shexj:
            if len(shexj['@graph']) != 1:
                raise ValueError(f"Multi-node graph emitted!")
            return tweak_shexj(shexj['@graph'][0])
        else:
            # Toss all other JSON-LD artifacts (primarily "@context")
            #   Also remove empty valueExprs
            #   Also remove all "shex:" prefixes -- why aren't these getting converted?
            return {k.replace('shex:', ''): tweak_shexj(v)
                    for k, v in shexj.items() if not k.startswith('@') and not (k == 'valueExpr' and not v)}
    elif isinstance(shexj, list):
        return [tweak_shexj(v) for v in shexj]
    else:
        return shexj
```
4. Eric's edits fixed everything except for the "shex:" prefix issue -- we'll be filing a bug report on them. _Note_, however, 
that Eric's edits also broke one thing -- schema itself must be a BNode -  `s/<FOO>/[]/`


## Project contents
### data
#### data/context
JSON-LD context files. `shex.context.jsonld` is a copy of https://www.w3.org/ns/shex.jsonld with:
* All of the RDF and other non-context removed
* The `"@container": "@list"` removed from the `schemas` definition.

This context file needs to be used when processing older ShExR that represent schemas as an unordered collection.

#### data/schemas
This directory contains the expanded JSON-LD representation of the turtle examples found in 
[shexSpec schemas](https://github.com/shexSpec/shexTest/tree/main/schemas) directory. Typical invocation:
```bash
> pipenv install
> pipenv run python -m shexrtoj.ttltojsonld ~/git/shexSpec/shexTest/schemas data/schemas                                                                                                                                            2 ↵ ──(Wed,Apr28)─┘
423 files converted
```

#### data/danbri
* `danbri.ttl` -- taken from https://gist.github.com/danbri/43eb914d29a2fd628f0d81868bd0447e
* `danbri.jsonld` -- raw json-ld representation of `danbri.ttl`
* `danbri.shexj` -- result of framing `danbri.jsonld` with `shex.context.jsonld`
* `danbri.shexjt` -- "tweaked" version of the above, after `tweak_shexj` was applied above
* `danbri.shexc` -- ShExC representation of `danbri.shexjt`

### shexrtoj directory

#### jsonldtoshexj.py
Convert expanded JSON-LD representation of ShExR to ShExJ representation.   
```text
python -m shexrtoj.jsonldtoshexj -h                                                                                                                                                                                    1 ↵ ──(Wed,Apr28)─┘
usage: jsonldtoshexj.py [-h] [-c CONTEXT] indir outdir

positional arguments:
  indir                 Location of input JSON-LD files
  outdir                Location to store output ShExJ files

optional arguments:
  -h, --help            show this help message and exit
  -c CONTEXT, --context CONTEXT
                        Location of JSON-LD context file (default: https://www.w3.org/ns/shex.jsonld

```
#### shexjtoshexc.py
Convert ShExJ to ShExC representation

 `shexjtoshec.py` shexj to shexc converter
Convert ShExJ to ShExC
```text
python -m shexrtoj.shexjtoshexc -h                                                                                                                                                                                         ──(Wed,Apr28)─┘
usage: shexjtoshexc.py [-h] indir outdir

positional arguments:
  indir       Location of input shexj files
  outdir      Location of output shexc files

optional arguments:
  -h, --help  show this help message and exit
```
#### ttltojsonld.py
Convert ".ttl" to an appropriate target format (typically jsonld)
```text
python -m shexrtoj.ttltojsonld --help                                                                                                                                                                                      ──(Wed,Apr28)─┘
usage: ttltojsonld.py [-h] [-f {nt11,nquads,nt,xml,ttl,turtle,pretty-xml,trix,n3,ntriples,trig,json-ld}] indir outdir

positional arguments:
  indir                 Location of input Turtle RDF files
  outdir                Location of output files

optional arguments:
  -h, --help            show this help message and exit
  -f {nt11,nquads,nt,xml,ttl,turtle,pretty-xml,trix,n3,ntriples,trig,json-ld}, --format {nt11,nquads,nt,xml,ttl,turtle,pretty-xml,trix,n3,ntriples,trig,json-ld}
                        Output format (Default: json-ld)
```
