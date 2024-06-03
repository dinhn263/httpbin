*** Settings ***
Library    JSONLibrary
Resource    ../../../main/common/common-api.resource
Library    ../../../main/utils/authentication.py
Variables    ../../resource/config.py
Variables    ../../resource/uri-resource.py

*** Keywords ***
Send GET request To Login With Basic Authentication
    [Arguments]    ${p_username}    ${p_password}
    ${headers}=    Get Common Header For Api Request
    ${method}=    Set Variable    get
    ${uri}=    Set Variable    ${URI_AUTH_BASIC}/${p_username}/${p_password}
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server With Basic Authentication   ${method}    ${base_url}    ${uri}    ${headers}    ${p_username}    ${p_password}
    RETURN    ${response}

Send GET request To Login With Digest Authentication
    [Arguments]    ${p_username}    ${p_password}    ${p_algorithm}=${EMPTY}    ${p_stale_after}=never
    ${headers}=    Get Common Header For Api Request
    ${method}=    Set Variable    get
    IF    '${p_algorithm}'=='${EMPTY}'
        ${uri}=    Set Variable    ${URI_AUTH_DIGEST}/${p_username}/${p_password}
    ELSE
        ${uri}=    Set Variable    ${URI_AUTH_DIGEST}/${p_username}/${p_password}/${p_algorithm}/${p_stale_after}
    END
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server With Degist Authentication    ${method}    ${base_url}    ${uri}    ${headers}    ${p_username}    ${p_password}
    RETURN    ${response}

Send GET request To Login With Hidden Basic Authentication
    [Arguments]    ${p_username}    ${p_password}
    ${headers}=    Get Common Header For Api Request
    ${method}=    Set Variable    get
    ${uri}=    Set Variable    ${URI_AUTH_HIDDEN_BASIC}/${p_username}/${p_password}
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server With Basic Authentication   ${method}    ${base_url}    ${uri}    ${headers}    ${p_username}    ${p_password}
    RETURN    ${response}
    
Assert Login Successfully Successfully
    [Arguments]    ${p_api_res}    ${p_expected_username}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    200    ${header_code_status}
    ${json}=    Convert String To Json    ${content}
    ${authenticated}=    Get Value From Json    ${json}    authenticated
    ${user}=    Get Value From Json    ${json}    user
    Should Be True    ${authenticated}[0]    msg=Authentication return not correct. Should Be true but return '${authenticated}[0]'
    Should Be True    '${user}[0]'=='${p_expected_username}'    msg=Username return not correct. Expected: '${p_expected_username}' but actual: '${user}[0]'




