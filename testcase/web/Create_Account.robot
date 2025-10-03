*** Settings ***
Library    SeleniumLibrary

Resource    ${EXECDIR}/keyword/web/setup_env.robot
Resource    ${EXECDIR}/keyword/web/open_website_keyword.robot
Resource    ${EXECDIR}/keyword/web/register_keyword.robot
Resource    ${EXECDIR}/keyword/web/check_error_message_keyword.robot

Variables    ${EXECDIR}/resources/variables/account.yaml

Suite Setup    setup_env.get_Base_Url    ENV=${ENV}

Test Setup    SeleniumLibrary.Set Selenium Speed    value=0.1s
Test Teardown    SeleniumLibrary.Close Browser

*** Test Cases ***
Create New Account
    ${set_time}    set_Current_And_Tomorrow_Date
    Log To Console    message=${set_time[2]}
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    Register_Website    email=create_account_${set_time[2]}@yopmail.com    password=create_password_${set_time[2]}    name=create_name${set_time[2]}    gender=Male
    check_Error_Message    message=dashboard

Create Account But Account Is Dupplicate
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    Register_Website    email=${login_email}    password=${login_password}    name=${name}    gender=Male
    check_Error_Message    message=Email already in use

Create Account But Not Input Email
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    Register_Website    email=${EMPTY}    password=${login_password}    name=${name}    gender=Male
    check_Error_Message    message=Please provide all values!

Create Account But Not Input Password
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    Register_Website    email=${login_email}    password=${EMPTY}    name=${name}    gender=Male
    check_Error_Message    message=Please provide all values!

Craete Account But Not Input Name
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    Register_Website    email=${login_email}    password=${login_password}    name=${EMPTY}    gender=Male
    check_Error_Message    message=Please provide all values!

Create Account But Not Select Gender
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    Register_Website    email=${new_account.new_email}    password=${login_password}    name=${name}    gender=${EMPTY}
    check_Error_Message    message=Internal server error