*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           DateTime
Library           String
Library           JSONLibrary
Library           jsonschema  WITH NAME  JSON
Variables         ../variables.py


*** Keywords ***
validate response schema
    [Arguments]     ${response}  ${schema}
    LOG             ${response.json()}
    LOG             ${schema}
    JSON.validate   ${response.json()}  ${schema}

