from json import dumps, loads
from pprint import pprint

from rdflib import Graph
from pyld.jsonld import frame
from rdflib_pyld_compat import pyld_jsonld_from_rdflib_graph

# A fragment of the model from https://www.w3.org/ns/shex.jsonld
context = {
    "@context": {
        "xsd": "http://www.w3.org/2001/XMLSchema#",
        "shex": "http://www.w3.org/ns/shex#",
        "maxInt": {
            "@id": "shex:max",
            "@type": "xsd:integer"
        },
        "maxDecimal": {
            "@id": "shex:max",
            "@type": "xsd:decimal"
        },
        "maxDouble": {
            "@id": "shex:max",
            "@type": "xsd:double"
        },
        "maxString": {
            "@id": "shex:max",
            "@type": "xsd:string"
        },
        "maxUnknown": {
            "@id": "shex:max"
        }
    }
}

# We would expect this turtle to produce
#   maxInt 42
#   maxDecimal 43.1
#   maxDouble 44.1
#   maxDouble 4.55e+117
#   maxString "46.1"
data_ttl_text = """@prefix shex: <http://www.w3.org/ns/shex#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://example.com/people#john> shex:max 
        42,
        43.1,
        4.41e+01,
        4.55e+117,
        "46.1" .
"""

# Convert it to JSON-LD
g = Graph()
g.parse(data=data_ttl_text, format="turtle")
data_json_text = g.serialize(format="json-ld").decode()
print()
print("-"*20)
print("Note that the _only_ type that gets transferred is the decimal type")
print(data_json_text)

# Frame the JSON-LD back to the source types
data_json = frame(loads(data_json_text), context)
print()
print("-"*20)
print("Note that that the only known type coming out is the double")
print(dumps(data_json, indent = '  '))

# Try the conversion library
print()
print("-"*20)
print("pyld_jsonld_from_rdflib_graph handles everything _except_ the double correctly")
data_pyld_input = pyld_jsonld_from_rdflib_graph(g)
# Note: data_pyld_input can't be dumped as JSON because of the "Double" function in the middle of things
print()
print("-"*20)
print("Formatted input coming from the graph")
pprint(data_pyld_input)
data_json_2 = frame(data_pyld_input, context)
print()
print("-"*20)
print("Note that that the only known type coming out is the double")
print(dumps(data_json, indent = '  '))
