import os
from argparse import ArgumentParser
from json import dumps, load
from typing import List, Optional, Dict, Union

from ShExJSG import ShExC

from shexrtoj import change_suffix


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


def genargs() -> ArgumentParser:
    """
    Generate an input string parser
    :return: parser
    """
    parser = ArgumentParser()
    parser.add_argument("indir", help="Location of input shexj files")
    parser.add_argument("outdir", help="Location of output shexc files")
    parser.add_argument("-s", "--save", help="Save edited shexj image before conversion", action="store_true")
    return parser


def main(argv: Optional[List[str]] = None):
    opts = genargs().parse_args(argv)

    if not os.path.isdir(opts.indir):
        print("Input directory {} doesn't exist".format(opts.indir), file=sys.stderr)
        sys.exit(1)
    os.makedirs(opts.outdir, exist_ok=True)

    conversion_count = 0
    for fname in os.listdir(opts.indir):
        if fname.endswith('.shexj'):
            out_fname = change_suffix(fname, '.shexj', '.shexc')
            try:
                with open(os.path.join(opts.indir, fname)) as f:
                    tweaked_shex = dumps(tweak_shexj(load(f)), indent='  ')
                    if opts.save:
                        with open(os.path.join(opts.outdir, change_suffix(fname, '.shexj', '.shexjt')), 'w') as outf:
                            outf.write(tweaked_shex)
                    shexc = str(ShExC(tweaked_shex))
                with open(os.path.join(opts.outdir, out_fname), 'w') as of:
                    of.write(shexc)
                conversion_count += 1
            except ValueError as e:
                print(f"{os.path.join(opts.indir, fname)} conversion failure")
                print(str(e))

    print(f"{conversion_count} files converted")


if __name__ == '__main__':
    main()

