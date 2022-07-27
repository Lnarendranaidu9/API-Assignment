"""Schemas used to validate endpoint responses."""
NON_EMPTY_STRING_PATTERN = "^(?!\\s*$).+"

# Response Schema
RESPONSE_SCHEMA = {
    "Meta Data": {
        "1. Information": {"type": "string"},
        "2. Symbol": {"type": "string"},
        "3. Last Refreshed": {"type": "date.now()"},
        "4. Output Size": {"type": "string"},
        "5. Time Zone": {"type": "string"}
    },
    "Time Series (Daily)": {
        "1. open": {"float": "integer"},
        "2. high": {"float": "integer"},
        "3. low": {"float": "integer"},
        "4. close": {"float": "integer"},
        "5. volume": {"float": "integer"}
    }
}


meta_data = '"Meta Data": { "1. Information": "Daily Prices (open, high, low, close) and Volumes", "2. Symbol": "IBM", "3. Last Refreshed": "2022-07-26", "4. Output Size": "Compact", "5. Time Zone": "US/Eastern"'

# {'$id': 'http://json-schema.org/draft-07/schema#',
#  '$schema': 'http://json-schema.org/draft-07/schema#',
#  'default': True,
#  'definitions': {'nonNegativeInteger': {'minimum': 0,
#                                         'type': 'integer'},
#                  'nonNegativeIntegerDefault0': {'allOf': [{'$ref': '#/definitions/nonNegativeInteger'},
#                                                           {'default': 0}]},
#                  'schemaArray': {'items': {'$ref': '#'},
#                                  'minItems': 1,
#                                  'type': 'array'},
#                  'simpleTypes': {'enum': ['array',
#                                           'boolean',
#                                           'integer',
#                                           'null',
#                                           'number',
#                                           [ Message content over the limit has been removed. ]
#                                           'properties': {'additionalProperties': {'$ref': '#'},
#                                                          'default': {},
#                                                          'type': 'object'},
# 'propertyNames': {'$ref': '#'},
# 'readOnly': {'default': False, 'type': 'boolean'},
# 'required': {'$ref': '#/definitions/stringArray'},
# 'then': {'$ref': '#'},
# 'title': {'type': 'string'},
# 'type': {'anyOf': [{'$ref': '#/definitions/simpleTypes'},
#                    {'items': {'$ref': '#/definitions/simpleTypes'},
#                     'minItems': 1,
#                     'type': 'array',
#                     'uniqueItems': True}]},
# 'uniqueItems': {'default': False, 'type': 'boolean'}},
# 'title': 'Core schema meta-schema',
# 'type': ['object', 'boolean']}
