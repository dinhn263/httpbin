*** Settings ***
Library    Collections
Library    ../utils/api-request.py

*** Keywords ***
Get Common Header For Api Request
    [Documentation]    This keyword is used for set common header. The common header only contains key "accept" with value is "application/json"
    ...    In case you want to add more key/value in the headers. 
    ...    First you need to create dictionary with key/ value and send it as the parameter p_dict.
    [Arguments]    ${p_dict}=@{EMPTY}
    ${headers}=    Create Dictionary    accept=application/json
    FOR    ${key}    IN    @{p_dict}
        ${value}=    Set Variable    ${p_dict["${key}"]}
        Set To Dictionary    ${headers}    ${key}=${value}
    END
    RETURN    ${headers}

    
Send Api Request To Server With Basic Authentication
    [Arguments]    ${p_method}    ${p_base_url}    ${p_uri}    ${p_headers}    ${p_username}    ${p_password}       
    ${response}=    Send Request With Basic Authen    method=${p_method}
    ...    base_url=${p_base_url}
    ...    uri=${p_uri}
    ...    headers=${p_headers}
    ...    username=${p_username}
    ...    password=${p_password}
    RETURN    ${response}

Send Api Request To Server With Degist Authentication
    [Arguments]    ${p_method}    ${p_base_url}    ${p_uri}    ${p_headers}    ${p_username}    ${p_password}
    ${response}=    Send Request With Degist Authen   method=${p_method}
    ...    base_url=${p_base_url}
    ...    uri=${p_uri}
    ...    headers=${p_headers}
    ...    username=${p_username}
    ...    password=${p_password}
    RETURN    ${response}
    
Send Api Request To Server
    [Arguments]    ${p_method}    ${p_base_url}    ${p_uri}    ${p_headers}={}     ${p_payload}={}
    ${response}=    Send Request    method=${p_method}
    ...    base_url=${p_base_url}
    ...    uri=${p_uri}
    ...    headers=${p_headers}
    ...    payload=${p_payload}
    RETURN    ${response}
    
    
    
    
    
Get Header Status Code And Response Content Of Api Request
    [Arguments]    ${p_api_response}
    ${header_status_code}=    Set Variable    ${p_api_response.status_code}
    ${content}=    Set Variable    ${p_api_response.text}
    RETURN    ${header_status_code}    ${content}
    
Assert Header Status Code Is Correct
    [Arguments]    ${p_expected_header_status_code}    ${p_actual_header_status_code}
    Should Be True    ${p_expected_header_status_code}==${p_actual_header_status_code}    msg=Header status code return is not correct. Expected '${p_expected_header_status_code}' but actual '${p_actual_header_status_code}'

    