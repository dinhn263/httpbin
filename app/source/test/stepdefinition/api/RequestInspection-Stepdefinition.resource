*** Settings ***
Library    JSONLibrary
Resource    ../../../main/common/common-api.resource
Library    ../../../main/utils/authentication.py
Variables    ../../resource/config.py
Variables    ../../resource/uri-resource.py

*** Keywords ***
Send GET Request To Inspect Request
    [Arguments]    ${p_inspect_type}
    ${headers}=    Get Common Header For Api Request
    ${method}=    Set Variable    get
    ${uri}=    Set Variable    ${p_inspect_type}
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server   ${method}    ${base_url}    ${uri}    ${headers}
    RETURN    ${response}
    
Assert Send GET Request To Inspect Request Header Successfully
    [Arguments]    ${p_api_res}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    200   ${header_code_status}
    ${json}=    Convert String To Json    ${content}
    ${headers}=    Get Value From Json    ${json}    $.headers
    Dictionary Should Contain Key    ${headers}[0]    Accept
    Dictionary Should Contain Key    ${headers}[0]    Accept-Encoding
    Dictionary Should Contain Key    ${headers}[0]    Content-Length
    Dictionary Should Contain Key    ${headers}[0]    Host
    Dictionary Should Contain Key    ${headers}[0]    User-Agent
    Dictionary Should Contain Key    ${headers}[0]    X-Amzn-Trace-Id
    
Assert Send GET Request To Inspect Request IP Successfully
    [Arguments]    ${p_api_res}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    200   ${header_code_status}
    ${json}=    Convert String To Json    ${content}
    ${ip}=    Get Value From Json    ${json}    $.origin
    Should Match Regexp    ${ip}[0]    \\d{1,3}.\\d{1,3}.\\d{1,3}.\\d{1,3}

Assert Send GET Request To Inspect Request User Agent Successfully
    [Arguments]    ${p_api_res}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    200   ${header_code_status}
    ${json}=    Convert String To Json    ${content}
    ${user-agent}=    Get Value From Json    ${json}    $.user-agent
    Should Match Regexp    ${user-agent}[0]    ^(python-requests)\/\\d.\\d{1,2}.\\d{1,2}$




