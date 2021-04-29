#!/usr/bin/env bash
pipenv install

# Convert all the ttl's into json-ld
pipenv run python -m shexrtoj.ttltojsonld data/danbri data/danbri

# Convert all the jsonld's into shexj
pipenv run python -m shexrtoj.jsonldtoshexj data/danbri data/danbri -c data/context/shex.context.jsonld

# Convert all the shexj's into shexc's
pipenv run python -m shexrtoj.shexjtoshexc -s data/danbri data/danbri
