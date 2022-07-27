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
postive test with a valid API key              ${base_url}           /query?function=TIME_SERIES_DAILY&symbol=IBM&apikey=TNNV1GQ706PZPJZ7             200

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
    run keyword if  '${statusCode}'=='200'   validate response schema  ${response}  ${RESPONSE_SCHEMA}
    run keyword if  '${statusCode}'=='200'   Should Contain Any  ${response.json()['Meta Data']}  1. Information  2. Symbol  3. Last Refreshed  4. Output Size  5. Time Zone
    run keyword if  '${statusCode}'=='200'   Should contain any  ${response.json()['Time Series (Daily)']}  2022-07-26  1. open  2. high  3. low  4. close  5. volume

validate response schema
    [Arguments]     ${response}  ${schema}
    LOG             ${response.json()}
    LOG             ${schema}
    JSON.validate   ${response.json()}  ${schema}

