*** Settings ***
Resource    ../../stepdefinition/api/Statuscode-Stepdefinition.resource
Variables   ../../resource/config.py



*** Test Cases ***
As a user I want to check status code 200 with delete method
    [Tags]    api    status-code
    ${method}=    Set Variable    delete
    ${code}=    Set Variable   200
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    200
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}


As a user I want to check status code 400 with delete method
    [Tags]    api    status-code
    ${method}=    Set Variable    delete
    ${code}=    Set Variable   400
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    400
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}
    
As a user I want to check status code 200 with get method
    [Tags]    api    status-code
     ${method}=    Set Variable    get
    ${code}=    Set Variable   200
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    200
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}

As a user I want to check status code 300 with get method
    [Tags]    api    status-code
     ${method}=    Set Variable    get
    ${code}=    Set Variable   300
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    300
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}
    
As a user I want to check status code 200 with get post
    [Tags]    api    status-code    
     ${method}=    Set Variable    post
    ${code}=    Set Variable   200
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    200
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}

As a user I want to check status code 400 with get post
    [Tags]    api    status-code
     ${method}=    Set Variable    post
    ${code}=    Set Variable   400
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    400
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}

As a user I want to check status code 200 with get put
    [Tags]    api    status-code
     ${method}=    Set Variable    put
    ${code}=    Set Variable   200
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    200
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}

As a user I want to check status code 400 with get put
    [Tags]    api    status-code
     ${method}=    Set Variable    put
    ${code}=    Set Variable   400
    ${response}=    Send Request To Get Status Code Detail    ${method}    ${code}
    ${expected_header_code_return}=    Set Variable    400
    Assert Send Request To Get Status Code Detail Correctly    ${response}    ${expected_header_code_return}

