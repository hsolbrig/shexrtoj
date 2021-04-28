import os
from argparse import ArgumentParser
from typing import List, Optional

from rdflib import Graph
from rdflib.plugin import plugins as rdflib_plugins, Serializer as rdflib_Serializer

from shexrtoj import change_suffix


def genargs() -> ArgumentParser:
    """
    Generate an input string parser
    :return: parser
    """
    parser = ArgumentParser()
    parser.add_argument("indir", help="Location of input Turtle RDF files")
    parser.add_argument("outdir", help="Location of output files")
    parser.add_argument("-f", "--format",
                        choices=list(set(x.name for x in rdflib_plugins(None, rdflib_Serializer)
                                         if '/' not in str(x.name))),
                        help="Output format (Default: json-ld)", default="json-ld")
    return parser


def main(argv: Optional[List[str]] = None):
    opts = genargs().parse_args(argv)

    if not os.path.isdir(opts.indir):
        print("Input directory {} doesn't exist".format(opts.indir), file=sys.stderr)
        sys.exit(1)
    os.makedirs(opts.outdir, exist_ok=True)

    conversion_count = 0
    for fname in os.listdir(opts.indir):
        if fname.endswith('.ttl'):
            out_fname = change_suffix(fname, '.ttl', opts.format.replace('-', ''))
            g = Graph()
            g.parse(os.path.join(opts.indir, fname), format="turtle")
            g.serialize(os.path.join(opts.outdir, out_fname), format=opts.format)
            conversion_count += 1

    print(f"{conversion_count} files converted")


if __name__ == '__main__':
    main()
