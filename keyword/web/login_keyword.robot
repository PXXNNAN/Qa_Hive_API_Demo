*** Settings ***
Library    SeleniumLibrary

Resource    ${EXECDIR}/resources/locator/login_page_locator.robot

*** Keywords ***
login_Website
    [Arguments]    ${email}    ${password}
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator_name_email_form}    timeout=10s    error=Email Form Not Visible
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator_name_password_from}    timeout=10s    error=Password Form Not Visible
    SeleniumLibrary.Wait Until Element Is Visible    locator=${locator_xpath_submit_button}    timeout=10s    error=Submit Button Not Visible
    SeleniumLibrary.Input Text    locator=${locator_name_email_form}    text=${email}
    SeleniumLibrary.Input Text    locator=${locator_name_password_from}    text=${password}
    SeleniumLibrary.Click Element    locator=${locator_xpath_submit_button}