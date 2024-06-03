*** Settings ***
Library    JSONLibrary
Resource    ../../../main/common/common-api.resource
Library    ../../../main/utils/authentication.py
Variables    ../../resource/config.py
Variables    ../../resource/uri-resource.py

*** Keywords ***
Send GET Request To Inspect With Cache
    [Arguments]    ${p_dict_cache}
    ${headers}=    Get Common Header For Api Request    ${p_dict_cache}
    ${method}=    Set Variable    get
    ${uri}=    Set Variable    cache
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server   ${method}    ${base_url}    ${uri}    ${headers}
    RETURN    ${response}

Send GET Request To Inspect Without Cache
    ${headers}=    Get Common Header For Api Request
    ${method}=    Set Variable    get
    ${uri}=    Set Variable    cache
    ${base_url}=    Set Variable    ${${ENV}_CONST_BASE_URL}
    ${response}=    Send Api Request To Server   ${method}    ${base_url}    ${uri}    ${headers}
    RETURN    ${response}
    
Assert Send GET Request To Inspect Request Without Cache Successfully
    [Arguments]    ${p_api_res}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    200   ${header_code_status}


Assert Send GET Request To Inspect Request With Cache Successfully
    [Arguments]    ${p_api_res}
    ${header_code_status}    ${content}    Get Header Status Code And Response Content Of Api Request    ${p_api_res}
    Assert Header Status Code Is Correct    304   ${header_code_status}



