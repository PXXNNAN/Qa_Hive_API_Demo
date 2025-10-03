*** Variables ***
# login form
${locator_name_email_form}    name=email
${locator_name_password_from}    name=password
${locator_xpath_submit_button}    xpath=//button[@data-testid="submit"]
${locator_xpath_register_button}    xpath=//button[@data-testid="loginLink" and contains(text(), "Register")]

# register form
${locator_name_name_form}    name=name
${locator_xpath_login_button}    xpath=//button[@data-testid="loginLink" and contains(text(), "Login")]