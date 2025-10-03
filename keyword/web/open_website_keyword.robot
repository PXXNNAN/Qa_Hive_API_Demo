*** Settings ***
Library    SeleniumLibrary

Resource    ${EXECDIR}/resources/locator/login_page_locator.robot

*** Keywords ***
open_Browser
    [Arguments]    ${url}    ${browser}
    SeleniumLibrary.Open Browser    url=${url}    browser=${browser}
    SeleniumLibrary.Maximize Browser Window