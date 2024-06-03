*** Settings ***
Library    JSONLibrary
Resource    ../../../main/common/common-api.resource
Library    ../../../main/utils/authentication.py
Variables    ../../resource/config.py
Variables    ../../resource/uri-resource.py

*** Keywords ***
Send Request To Get Status Code detail
    [Arguments]    ${p_method}    ${p_code}
    ${headers}=    Get Common Header For Api Request
    ${method}=    Set Variable    ${p_method}
    ${uri}=    Set Variable    ${URI_STATUS_CODE}/${p_code}
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server   ${method}    ${base_url}    ${uri}    ${headers}
    RETURN    ${response}
    
Assert Send request To Get Status Code Detail Correctly
    [Arguments]    ${p_api_res}    ${p_expected_header_code}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    ${p_expected_header_code}    ${header_code_status}

