import os


def change_suffix(fname: str, old_suffix: str, new_suffix: str) -> str:
    if not new_suffix.startswith('.'):
        new_suffix = '.' + new_suffix
    if fname.endswith(old_suffix):
        return fname[:-len(old_suffix)] + new_suffix
    raise ValueError(f"{fname} does not end with {old_suffix}")


def to_fileurl(fpath: str) -> str:
    return f"file://{os.path.abspath(fpath)}" if '://' not in fpath else fpath
