*** Settings ***
Resource    ../../stepdefinition/api/RequestInspection-Stepdefinition.resource
Variables   ../../resource/config.py



*** Test Cases ***
As a user I want to check header inspection
    [Tags]    api    request-inspection
    ${type}=    Set Variable    headers    
    ${response}=    Send GET Request To Inspect Request    ${type}
    Assert Send GET Request To Inspect Request Header Successfully    ${response}

As a user I want to check ip inspection
    [Tags]    api    request-inspection
    ${type}=    Set Variable    ip
    ${response}=    Send GET Request To Inspect Request    ${type}
    Assert Send GET Request To Inspect Request IP Successfully    ${response}

As a user I want to check user-agent inspection
    [Tags]    api    request-inspection    temp
    ${type}=    Set Variable    user-agent
    ${response}=    Send GET Request To Inspect Request    ${type}
    Assert Send GET Request To Inspect Request User Agent Successfully    ${response}


