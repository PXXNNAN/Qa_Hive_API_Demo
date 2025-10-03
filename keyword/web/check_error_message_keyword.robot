*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
check_Error_Message
    [Arguments]    ${message}
    SeleniumLibrary.Wait Until Page Contains    text=${message}    timeout=10s    error=Can't Find ${message}