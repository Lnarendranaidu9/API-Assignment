*** Settings ***
Documentation
Variables         ../variables.py
Variables         ../schemas.py
Library           RequestsLibrary
Library           Collections
Library           JSONLibrary
Library           String
Library           DateTime
Library           jsonschema  WITH NAME  JSON
Resource          resource.robot
Test Template     Validate API

*** Test Cases ***
#  Requests                                    base_url                   path                                                                       statusCode
URL with missing function in query param       ${base_url}           /query?function=&symbol=IBM&apikey=TNNV1GQ706PZPJZ7                              200

*** Keywords ***
Validate API
    [Arguments]  ${base_url}  ${path}  ${statusCode}
    Create Session  api  ${base_url}  disable_warnings=1
    ${response}=   GET On Session   api   url=${path}  expected_status=${statusCode}
    ${get_status_code}=   convert to string    ${response.status_code}
    should be equal   ${get_status_code}   ${statusCode}
    should be equal as strings   ${response.status_code}   ${statusCode}
    ${json_response}=  set variable    ${response.json()}
    log    ${json_response}
    log    ${response.json()}
    log to console   status code is ${get_status_code}
    run keyword if  '${statusCode}'=='200'   Should Contain Any  ${response.json()}  Error Message  function

validate response schema
    [Arguments]     ${response}  ${schema}
    LOG             ${response.json()}
    LOG             ${schema}
    JSON.validate   ${response.json()}  ${schema}

