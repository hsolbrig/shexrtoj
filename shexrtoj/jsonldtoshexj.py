import os
from argparse import ArgumentParser
from json import dumps
from typing import List, Optional

from pyld import jsonld

from shexrtoj import change_suffix, to_fileurl


def genargs() -> ArgumentParser:
    """
    Generate an input string parser
    :return: parser
    """
    parser = ArgumentParser()
    parser.add_argument("indir", help="Location of input JSON-LD files")
    parser.add_argument("outdir", help="Location to store output ShExJ files")
    parser.add_argument("-c", "--context",
                        help="Location of JSON-LD context file (default: https://www.w3.org/ns/shex.jsonld",
                        default="https://www.w3.org/ns/shex.jsonld")
    return parser


def main(argv: Optional[List[str]] = None):
    opts = genargs().parse_args(argv)

    if not os.path.isdir(opts.indir):
        print("Input directory {} doesn't exist".format(opts.indir), file=sys.stderr)
        sys.exit(1)
    os.makedirs(opts.outdir, exist_ok=True)

    conversion_count = 0
    for fname in os.listdir(opts.indir):
        if fname.endswith('.jsonld'):
            out_fname = change_suffix(fname, '.jsonld', '.shexj')
            with open(os.path.join(opts.indir, fname)) as dataf:
                data = dataf.read()
            data_as_dict = jsonld.frame(data, to_fileurl(opts.context))

            with open(os.path.join(opts.outdir, out_fname), 'w') as outf:
                outf.write(dumps(data_as_dict, indent='  '))
            conversion_count += 1

    print(f"{conversion_count} files converted")


if __name__ == '__main__':
    main()
