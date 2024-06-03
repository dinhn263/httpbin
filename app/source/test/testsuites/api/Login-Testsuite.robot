*** Settings ***
Resource    ../../stepdefinition/api/Login-Stepdefinition.resource
Variables   ../../resource/config.py



*** Test Cases ***
As a user I want to check basic authentication login successfully
    [Tags]    api    basic-authen    login
    ${username}=    Set Variable    ${${ENV}_CONST_USERNAME}
    ${password}=    Set Variable    ${${ENV}_CONST_PASSWORD}
    ${response}=    Send GET request To Login With Basic Authentication    ${username}    ${password}
    Assert Login Successfully Successfully   ${response}    ${username}


As a user I want to check Digest authentication login successfully
    [Tags]    api    digest-authen    login
    ${username}=    Set Variable    ${${ENV}_CONST_USERNAME}
    ${password}=    Set Variable    ${${ENV}_CONST_PASSWORD}
    ${response}=    Send GET Request To Login With Digest Authentication    ${username}    ${password}
    Assert Login Successfully Successfully   ${response}    ${username}
    
As a user I want to check Digest with Algorithm authentication login successfully
    [Tags]    api    digest-authen-algorithm    login
    ${username}=    Set Variable    ${${ENV}_CONST_USERNAME}
    ${password}=    Set Variable    ${${ENV}_CONST_PASSWORD}
    ${algorithm}=    Set Variable    MD5
    ${response}=    Send GET Request To Login With Digest Authentication    ${username}    ${password}    ${algorithm}
    Assert Login Successfully Successfully   ${response}    ${username}
    
As a user I want to check Digest with Algorithm and allow setting stale_after authentication login successfully
    [Tags]    api    digest-authen-algorithm    login
    ${username}=    Set Variable    ${${ENV}_CONST_USERNAME}
    ${password}=    Set Variable    ${${ENV}_CONST_PASSWORD}
    ${algorithm}=    Set Variable    MD5
    ${stale_after}=    Set Variable    never
    ${response}=    Send GET Request To Login With Digest Authentication    ${username}    ${password}    ${algorithm}    ${stale_after}
    Assert Login Successfully Successfully   ${response}    ${username}

As a user I want to check hiden basic authentication login successfully
    [Tags]    api    hiden-basic-authen    login
    ${username}=    Set Variable    ${${ENV}_CONST_USERNAME}
    ${password}=    Set Variable    ${${ENV}_CONST_PASSWORD}
    ${response}=    Send GET request To Login With Hidden Basic Authentication    ${username}    ${password}
    Assert Login Successfully Successfully   ${response}    ${username}
