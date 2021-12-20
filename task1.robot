*** Settings ***
Library     SeleniumLibrary
Resource    keywords.robot
*** Variables ***
${login_btn}        dt_login_button
${email_field}      name=email
${login_oauth_btn}      //*[@class="button secondary"]

*** Keyword ***
Login
    [arguments]     ${hello_email}      ${hello_pw}
     open browser    https://app.deriv.com/     chrome
     maximize browser window
     Wait until page does not contain element     dt_core_header_acc-info-preloader     60
     Wait until page contains element    ${login_btn}     60
     click element    id=${login_btn}
     Wait until page contains element    ${email_field}
     input text  ${email_field}     ${hello_email}
     input password  id=txtPass     ${hello_pw}
     click element    ${login_oauth_btn}
     Wait until page contains element    //*[text()="Deposit" and contains(@class,"dc-text dc-btn__text")]     60
     Wait until page contains element    dt_core_account-info_acc-info     60

*** Test Cases ***
Task 1
    Login       ${my_email}     ${my_pw}
    Wait until page does not contain element    //*[@aria-label="Loading interface..."]
    click element    dt_core_account-info_acc-info
    Wait until page contains element        //*[text()="Real" and contains(@class,"active")]    10
    Wait until page contains element    //*[text()="Demo" and not(contains(@class,"active"))]
    click element   //*[@id="dt_core_account-switcher_demo-tab"]
    Wait until page contains element    //*[text()="Demo" and contains(@class,"active")]
    Log to console     Test Completed