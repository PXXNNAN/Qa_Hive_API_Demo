*** Settings ***
Library    ${EXECDIR}/resources/configs/env/set_env.py
Library    DateTime

*** Variables ***
${ENV}    dev
${ecommerce_url}    NONE
${chrome}    chrome
*** Keywords ***
get_Base_Url
    [Arguments]    ${ENV}
    ${ecommerce_url}=    set_env.Get Value    ${ENV}    ecommerce_url
    Set Suite Variable    ${ecommerce_url}

set_Current_And_Tomorrow_Date
    ${current_date}    Get Current Date    result_format=%Y-%m-%d
    ${tomorrow_date}    Add Time To Date    ${current_date}    1 day    result_format=%Y-%m-%d

    ${current_datetime}    Get Current Date    result_format=%Y_%m_%d_%H_%M_%S
    ${tomorrow_datetime}   Add Time To Date    ${current_datetime}    1 day    result_format=%Y_%m_%d_%H_%M_%S

    RETURN    ${current_date}    ${tomorrow_date}    ${current_datetime}    ${tomorrow_datetime}