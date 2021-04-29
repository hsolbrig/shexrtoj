{
  "@context": {
    "@vocab": "http://www.w3.org/ns/shex#",
    "rdf": "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
    "rdfs": "http://www.w3.org/2000/01/rdf-schema#",
    "shex": "http://www.w3.org/ns/shex#",
    "xsd": "http://www.w3.org/2001/XMLSchema#",
    "annotations": {
      "@id": "shex:annotation",
      "@container": "@list",
      "@type": "@id"
    },
    "exclusions": {
      "@id": "shex:exclusion",
      "@container": "@list",
      "@type": "@id"
    },
    "id": "@id",
    "language": "@language",
    "type": "@type",
    "value": "@value",
    "Annotation": "shex:Annotation",
    "EachOf": "shex:EachOf",
    "IriStem": "shex:IriStem",
    "IriStemRange": "shex:IriStemRange",
    "Language": "shex:Language",
    "LanguageStem": "shex:LanguageStem",
    "LanguageStemRange": "shex:LanguageStemRange",
    "LiteralStem": "shex:LiteralStem",
    "LiteralStemRange": "shex:LiteralStemRange",
    "NodeConstraint": "shex:NodeConstraint",
    "OneOf": "shex:OneOf",
    "Schema": "shex:Schema",
    "SemAct": "shex:SemAct",
    "Shape": "shex:Shape",
    "ShapeAnd": "shex:ShapeAnd",
    "ShapeExternal": "shex:ShapeExternal",
    "ShapeNot": "shex:ShapeNot",
    "ShapeOr": "shex:ShapeOr",
    "Stem": "shex:Stem",
    "StemRange": "shex:StemRange",
    "TripleConstraint": "shex:TripleConstraint",
    "Wildcard": "shex:Wildcard",
    "closed": {
      "@id": "shex:closed",
      "@type": "xsd:boolean"
    },
    "code": {
      "@id": "shex:code",
      "@language": null
    },
    "datatype": {
      "@id": "shex:datatype",
      "@type": "@id"
    },
    "expression": {
      "@id": "shex:expression",
      "@type": "@id"
    },
    "expressions": {
      "@id": "shex:expressions",
      "@type": "@id",
      "@container": "@list"
    },
    "extra": {
      "@id": "shex:extra",
      "@type": "@id"
    },
    "flags": {
      "@id": "shex:flags",
      "@language": null
    },
    "fractiondigits": {
      "@id": "shex:fractiondigits",
      "@type": "xsd:integer"
    },
    "inverse": {
      "@id": "shex:inverse",
      "@type": "xsd:boolean"
    },
    "languageTag": {
      "@id": "shex:languageTag",
      "@language": null
    },
    "length": {
      "@id": "shex:length",
      "@type": "xsd:integer"
    },
    "max": {
      "@id": "shex:max",
      "@type": "xsd:integer"
    },
    "maxexclusive": {
      "@id": "shex:maxexclusive",
      "@type": "xsd:integer"
    },
    "maxinclusive": {
      "@id": "shex:maxinclusive",
      "@type": "xsd:integer"
    },
    "maxlength": {
      "@id": "shex:maxlength",
      "@type": "xsd:integer"
    },
    "min": {
      "@id": "shex:min",
      "@type": "xsd:integer"
    },
    "minexclusive": {
      "@id": "shex:minexclusive",
      "@type": "xsd:integer"
    },
    "mininclusive": {
      "@id": "shex:mininclusive",
      "@type": "xsd:integer"
    },
    "minlength": {
      "@id": "shex:minlength",
      "@type": "xsd:integer"
    },
    "name": {
      "@id": "shex:name",
      "@type": "@id"
    },
    "nodeKind": {
      "@id": "shex:nodeKind",
      "@type": "@vocab"
    },
    "object": {
      "@id": "shex:object",
      "@type": "@id"
    },
    "pattern": {
      "@id": "shex:pattern",
      "@language": null
    },
    "predicate": {
      "@id": "shex:predicate",
      "@type": "@id"
    },
    "semActs": {
      "@id": "shex:semActs",
      "@type": "@id",
      "@container": "@list"
    },
    "shapeExpr": {
      "@id": "shex:shapeExpr",
      "@type": "@id"
    },
    "shapeExprs": {
      "@id": "shex:shapeExprs",
      "@type": "@id",
      "@container": "@list"
    },
    "shapes": {
      "@id": "shex:shapes",
      "@type": "@id",
      "@container": "@list"
    },
    "start": {
      "@id": "shex:start",
      "@type": "@id"
    },
    "startActs": {
      "@id": "shex:startActs",
      "@type": "@id",
      "@container": "@list"
    },
    "stem": {
      "@id": "shex:stem",
      "@type": "xsd:string"
    },
    "totaldigits": {
      "@id": "shex:totaldigits",
      "@type": "xsd:integer"
    },
    "valueExpr": {
      "@id": "shex:valueExpr",
      "@type": "@id"
    },
    "values": {
      "@id": "shex:values",
      "@type": "@id",
      "@container": "@list"
    },
    "bnode": "shex:bnode",
    "iri": "shex:iri",
    "literal": "shex:literal",
    "nonliteral": "shex:nonliteral"
  },
  "type": "Schema",
  "shex:shapes": {
    "type": "ShapeAnd",
    "shapeExprs": [
      {
        "type": "Shape",
        "expression": {
          "type": "TripleConstraint",
          "shex:max": -1,
          "shex:min": 1,
          "predicate": "http://schema.org/url",
          "semActs": [
            {
              "type": "SemAct",
              "code": "console.log('some url checking code here')",
              "name": "https://example.org/extension/dummy"
            }
          ]
        }
      },
      {
        "type": "Shape",
        "expression": {
          "type": "TripleConstraint",
          "shex:max": 1,
          "shex:min": 0,
          "predicate": "http://schema.org/datePublished",
          "valueExpr": {}
        }
      },
      {
        "type": "Shape",
        "expression": {
          "type": "TripleConstraint",
          "predicate": "http://schema.org/claimReviewed"
        }
      },
      {
        "type": "Shape",
        "expression": {
          "type": "TripleConstraint",
          "shex:max": 1,
          "shex:min": 0,
          "predicate": "http://schema.org/itemReviewed",
          "valueExpr": {
            "type": "ShapeAnd",
            "shapeExprs": [
              {
                "type": "Shape",
                "expression": {
                  "type": "TripleConstraint",
                  "predicate": "rdf:type",
                  "valueExpr": {
                    "type": "NodeConstraint",
                    "values": [
                      "file:///Users/solbrig/git/hsolbrig/shexrtoj/data/danbri/danbri.ttl"
                    ]
                  }
                }
              },
              {
                "type": "ShapeOr",
                "shapeExprs": [
                  {
                    "type": "ShapeNot",
                    "shapeExpr": {
                      "type": "Shape",
                      "expression": {
                        "type": "TripleConstraint",
                        "predicate": "rdf:type",
                        "valueExpr": {
                          "type": "NodeConstraint",
                          "values": [
                            "file:///Users/solbrig/git/hsolbrig/shexrtoj/data/danbri/danbri.ttl"
                          ]
                        }
                      }
                    }
                  },
                  {
                    "type": "ShapeAnd",
                    "shapeExprs": [
                      {
                        "type": "Shape",
                        "expression": {
                          "type": "TripleConstraint",
                          "shex:max": 1,
                          "shex:min": 0,
                          "predicate": "http://schema.org/author",
                          "valueExpr": {
                            "type": "ShapeAnd",
                            "shapeExprs": [
                              {
                                "type": "ShapeOr",
                                "shapeExprs": [
                                  {
                                    "type": "Shape",
                                    "expression": {
                                      "type": "TripleConstraint",
                                      "predicate": "rdf:type",
                                      "valueExpr": {
                                        "type": "NodeConstraint",
                                        "values": [
                                          "http://schema.org/Organization"
                                        ]
                                      }
                                    }
                                  },
                                  {
                                    "type": "Shape",
                                    "expression": {
                                      "type": "TripleConstraint",
                                      "predicate": "rdf:type",
                                      "valueExpr": {
                                        "type": "NodeConstraint",
                                        "values": [
                                          "http://schema.org/Person"
                                        ]
                                      }
                                    }
                                  }
                                ]
                              },
                              {
                                "type": "ShapeOr",
                                "shapeExprs": [
                                  {
                                    "type": "ShapeNot",
                                    "shapeExpr": {
                                      "type": "ShapeOr",
                                      "shapeExprs": [
                                        {
                                          "type": "Shape",
                                          "expression": {
                                            "type": "TripleConstraint",
                                            "predicate": "rdf:type",
                                            "valueExpr": {
                                              "type": "NodeConstraint",
                                              "values": [
                                                "http://schema.org/Organization"
                                              ]
                                            }
                                          }
                                        },
                                        {
                                          "type": "Shape",
                                          "expression": {
                                            "type": "TripleConstraint",
                                            "predicate": "rdf:type",
                                            "valueExpr": {
                                              "type": "NodeConstraint",
                                              "values": [
                                                "http://schema.org/Person"
                                              ]
                                            }
                                          }
                                        }
                                      ]
                                    }
                                  },
                                  {
                                    "type": "ShapeAnd",
                                    "shapeExprs": [
                                      {
                                        "type": "Shape",
                                        "expression": {
                                          "type": "TripleConstraint",
                                          "shex:max": 1,
                                          "shex:min": 0,
                                          "predicate": "http://schema.org/name"
                                        }
                                      }
                                    ]
                                  }
                                ]
                              }
                            ]
                          }
                        }
                      },
                      {
                        "type": "Shape",
                        "expression": {
                          "type": "TripleConstraint",
                          "shex:max": 1,
                          "shex:min": 0,
                          "predicate": "http://schema.org/datePublished",
                          "valueExpr": {}
                        }
                      }
                    ]
                  }
                ]
              }
            ]
          }
        }
      },
      {
        "type": "Shape",
        "expression": {
          "type": "TripleConstraint",
          "shex:max": 1,
          "shex:min": 0,
          "predicate": "http://schema.org/author",
          "valueExpr": {
            "type": "ShapeAnd",
            "shapeExprs": [
              {
                "type": "ShapeOr",
                "shapeExprs": [
                  {
                    "type": "Shape",
                    "expression": {
                      "type": "TripleConstraint",
                      "predicate": "rdf:type",
                      "valueExpr": {
                        "type": "NodeConstraint",
                        "values": [
                          "http://schema.org/Organization"
                        ]
                      }
                    }
                  },
                  {
                    "type": "Shape",
                    "expression": {
                      "type": "TripleConstraint",
                      "predicate": "rdf:type",
                      "valueExpr": {
                        "type": "NodeConstraint",
                        "values": [
                          "http://schema.org/Person"
                        ]
                      }
                    }
                  }
                ]
              },
              {
                "type": "ShapeOr",
                "shapeExprs": [
                  {
                    "type": "ShapeNot",
                    "shapeExpr": {
                      "type": "ShapeOr",
                      "shapeExprs": [
                        {
                          "type": "Shape",
                          "expression": {
                            "type": "TripleConstraint",
                            "predicate": "rdf:type",
                            "valueExpr": {
                              "type": "NodeConstraint",
                              "values": [
                                "http://schema.org/Organization"
                              ]
                            }
                          }
                        },
                        {
                          "type": "Shape",
                          "expression": {
                            "type": "TripleConstraint",
                            "predicate": "rdf:type",
                            "valueExpr": {
                              "type": "NodeConstraint",
                              "values": [
                                "http://schema.org/Person"
                              ]
                            }
                          }
                        }
                      ]
                    }
                  },
                  {
                    "type": "ShapeAnd",
                    "shapeExprs": [
                      {
                        "type": "ShapeOr",
                        "shapeExprs": [
                          {
                            "type": "Shape",
                            "expression": {
                              "type": "TripleConstraint",
                              "predicate": "http://schema.org/name"
                            }
                          },
                          {
                            "type": "Shape",
                            "expression": {
                              "type": "TripleConstraint",
                              "predicate": "http://schema.org/url"
                            }
                          }
                        ]
                      },
                      {
                        "type": "Shape",
                        "expression": {
                          "type": "TripleConstraint",
                          "shex:max": -1,
                          "shex:min": 0,
                          "predicate": "http://schema.org/url",
                          "semActs": [
                            {
                              "type": "SemAct",
                              "code": "console.log('some url checking code here')",
                              "name": "https://example.org/extension/dummy"
                            }
                          ]
                        }
                      }
                    ]
                  }
                ]
              }
            ]
          }
        }
      },
      {
        "type": "Shape",
        "expression": {
          "type": "TripleConstraint",
          "shex:max": -1,
          "shex:min": 1,
          "predicate": "http://schema.org/reviewRating",
          "valueExpr": {
            "type": "ShapeAnd",
            "shapeExprs": [
              {
                "type": "Shape",
                "expression": {
                  "type": "TripleConstraint",
                  "predicate": "rdf:type",
                  "valueExpr": {
                    "type": "NodeConstraint",
                    "values": [
                      "http://schema.org/Rating"
                    ]
                  }
                }
              },
              {
                "type": "ShapeOr",
                "shapeExprs": [
                  {
                    "type": "ShapeNot",
                    "shapeExpr": {
                      "type": "Shape",
                      "expression": {
                        "type": "TripleConstraint",
                        "predicate": "rdf:type",
                        "valueExpr": {
                          "type": "NodeConstraint",
                          "values": [
                            "http://schema.org/Rating"
                          ]
                        }
                      }
                    }
                  },
                  {
                    "type": "ShapeAnd",
                    "shapeExprs": [
                      {
                        "type": "Shape",
                        "expression": {
                          "type": "TripleConstraint",
                          "predicate": "http://schema.org/alternateName"
                        }
                      },
                      {
                        "type": "ShapeAnd",
                        "shapeExprs": [
                          {
                            "type": "ShapeOr",
                            "shapeExprs": [
                              {
                                "type": "ShapeNot",
                                "shapeExpr": {
                                  "type": "Shape",
                                  "expression": {
                                    "type": "TripleConstraint",
                                    "predicate": "http://schema.org/name"
                                  }
                                }
                              },
                              {
                                "type": "Shape",
                                "expression": {
                                  "type": "TripleConstraint",
                                  "shex:max": 1,
                                  "shex:min": 0,
                                  "predicate": "http://schema.org/alternateName"
                                }
                              }
                            ]
                          },
                          {
                            "type": "ShapeOr",
                            "shapeExprs": [
                              {
                                "type": "ShapeNot",
                                "shapeExpr": {
                                  "type": "ShapeNot",
                                  "shapeExpr": {
                                    "type": "Shape",
                                    "expression": {
                                      "type": "TripleConstraint",
                                      "predicate": "http://schema.org/name"
                                    }
                                  }
                                }
                              },
                              {
                                "type": "Shape",
                                "expression": {
                                  "type": "TripleConstraint",
                                  "shex:max": -1,
                                  "shex:min": 1,
                                  "predicate": "http://schema.org/alternateName"
                                }
                              }
                            ]
                          }
                        ]
                      },
                      {
                        "type": "ShapeNot",
                        "shapeExpr": {
                          "type": "ShapeAnd",
                          "shapeExprs": [
                            {
                              "type": "Shape",
                              "expression": {
                                "type": "TripleConstraint",
                                "predicate": "http://schema.org/alternateName"
                              }
                            },
                            {
                              "type": "Shape",
                              "expression": {
                                "type": "TripleConstraint",
                                "predicate": "http://schema.org/name"
                              }
                            }
                          ]
                        }
                      },
                      {
                        "type": "ShapeOr",
                        "shapeExprs": [
                          {
                            "type": "ShapeNot",
                            "shapeExpr": {
                              "type": "ShapeAnd",
                              "shapeExprs": [
                                {
                                  "type": "ShapeOr",
                                  "shapeExprs": [
                                    {
                                      "type": "Shape",
                                      "expression": {
                                        "type": "TripleConstraint",
                                        "predicate": "http://schema.org/ratingValue"
                                      }
                                    },
                                    {
                                      "type": "Shape",
                                      "expression": {
                                        "type": "TripleConstraint",
                                        "predicate": "http://schema.org/bestRating"
                                      }
                                    },
                                    {
                                      "type": "Shape",
                                      "expression": {
                                        "type": "TripleConstraint",
                                        "predicate": "http://schema.org/worstRating"
                                      }
                                    }
                                  ]
                                },
                                {
                                  "type": "ShapeNot",
                                  "shapeExpr": {
                                    "type": "ShapeAnd",
                                    "shapeExprs": [
                                      {
                                        "type": "Shape",
                                        "expression": {
                                          "type": "TripleConstraint",
                                          "predicate": "http://schema.org/ratingValue",
                                          "valueExpr": {
                                            "type": "NodeConstraint",
                                            "pattern": "-1"
                                          }
                                        }
                                      },
                                      {
                                        "type": "Shape",
                                        "expression": {
                                          "type": "TripleConstraint",
                                          "predicate": "http://schema.org/bestRating",
                                          "valueExpr": {
                                            "type": "NodeConstraint",
                                            "pattern": "-1"
                                          }
                                        }
                                      },
                                      {
                                        "type": "Shape",
                                        "expression": {
                                          "type": "TripleConstraint",
                                          "predicate": "http://schema.org/worstRating",
                                          "valueExpr": {
                                            "type": "NodeConstraint",
                                            "pattern": "-1"
                                          }
                                        }
                                      }
                                    ]
                                  }
                                }
                              ]
                            }
                          },
                          {
                            "type": "ShapeAnd",
                            "shapeExprs": [
                              {
                                "type": "Shape",
                                "expression": {
                                  "type": "TripleConstraint",
                                  "shex:max": -1,
                                  "shex:min": 1,
                                  "predicate": "http://schema.org/ratingValue",
                                  "valueExpr": {
                                    "type": "ShapeOr",
                                    "shapeExprs": [
                                      {
                                        "type": "NodeConstraint",
                                        "pattern": "(\\d+[\\.,]?\\d*)/(\\d+[\\.,]?\\d*)"
                                      },
                                      {
                                        "type": "NodeConstraint",
                                        "pattern": "(\\d+[\\.,]?\\d*)%"
                                      },
                                      {
                                        "type": "NodeConstraint",
                                        "pattern": "(\\d+[\\.,]?\\d*)"
                                      }
                                    ]
                                  }
                                }
                              },
                              {
                                "type": "ShapeOr",
                                "shapeExprs": [
                                  {
                                    "type": "ShapeNot",
                                    "shapeExpr": {
                                      "type": "Shape",
                                      "expression": {
                                        "type": "TripleConstraint",
                                        "shex:max": -1,
                                        "shex:min": 1,
                                        "predicate": "http://schema.org/ratingValue",
                                        "valueExpr": {
                                          "type": "NodeConstraint",
                                          "pattern": "(\\d+[\\.,]?\\d*)"
                                        }
                                      }
                                    }
                                  },
                                  {
                                    "type": "Shape",
                                    "expression": {
                                      "type": "TripleConstraint",
                                      "predicate": "rdf:type",
                                      "valueExpr": {
                                        "type": "NodeConstraint",
                                        "values": [
                                          "file:///Users/solbrig/git/hsolbrig/shexrtoj/data/danbri/danbri.ttl"
                                        ]
                                      }
                                    }
                                  }
                                ]
                              }
                            ]
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        }
      }
    ]
  }
}