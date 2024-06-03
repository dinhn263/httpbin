*** Settings ***
Resource    ../../stepdefinition/api/ResponseInspection-Stepdefinition.resource
Variables   ../../resource/config.py



*** Test Cases ***
As a user I want to check request with cache response inspection
    [Tags]    api    response-inspection    temp
    ${dict}=    Create Dictionary    If-Modified-Since=Wed, 21 Oct 2015 07:28:00 GMT
    ${response}=    Send GET Request To Inspect With Cache    ${dict}
    Assert Send GET Request To Inspect Request With Cache Successfully    ${response}

As a user I want to check request without cache response inspection
    [Tags]    api    response-inspection    temp
    ${dict}=    Create Dictionary    If-Modified-Since=Wed, 21 Oct 2015 07:28:00 GMT
    ${response}=    Send GET Request To Inspect Without Cache
    Assert Send GET Request To Inspect Request Without Cache Successfully    ${response}

