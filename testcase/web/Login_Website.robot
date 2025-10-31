*** Settings ***
Library    SeleniumLibrary

Resource    ${EXECDIR}/keyword/web/setup_env.robot
Resource    ${EXECDIR}/keyword/web/open_website_keyword.robot
Resource    ${EXECDIR}/keyword/web/login_keyword.robot
Resource    ${EXECDIR}/keyword/web/check_error_message_keyword.robot

Variables    ${EXECDIR}/resources/variables/account.yaml

Suite Setup    setup_env.get_Base_Url    ENV=${ENV}

Test Setup    SeleniumLibrary.Set Selenium Speed    value=0.1s
Test Teardown    SeleniumLibrary.Close Browser

*** Test Cases ***
Login To Website By Use Invalid Password
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    login_Website    email=${login_email}    password=123456
    check_Error_Message    message=Unauthorized

Login To Website By Use Invalid Email
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    login_Website    email=zutallillixeu-7178@yopmail.com    password=${login_password}
    check_Error_Message    message=Unauthorized

Login To Website By Use Empty Email And Password
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    login_Website    email=${EMPTY}    password=${EMPTY}
    check_Error_Message    message=Please provide all values!

Login To Website By Use Valid Account
    open_Browser    url=${ecommerce_url}    browser=${chrome}
    login_Website    email=${login_email}    password=${login_password}
    check_Error_Message    message=Login Successful! Redirecting...