*** Settings ***
Library     SeleniumLibrary
Resource    keywords.robot
*** Variables ***
${login_btn}        dt_login_button
${email_field}      name=email
${login_oauth_btn}      //*[@class="button secondary"]

*** Keyword ***




*** Test Cases ***
Task 2 Buy Rise contract
    Login       ${my_email}     ${my_pw}
    Wait until page contains element     //*[@class="cq-chart-price"]       60
    click element      //*[@class="cq-chart-price"]
    Wait until page contains element        //*[text()="Synthetic Indices"]//parent::div[contains(@class,"sc-mcd__filter__item--selected")]    15
    click element   //*[text()="Synthetic Indices"]//parent::div[contains(@class,"sc-mcd__filter__item--selected")]
    Wait until page contains element    //*[text()="Volatility 10 (1s) Index"]      20
    click element   //*[text()="Volatility 10 (1s) Index"]
    wait until page does not contain element    //*[@class="initial-loader initial-loader--fullscreen"]         80
    Wait until page contains element       //*[@name="contract_type" and contains(@value,"rise_fall")]          10
    wait until page does not contain element    //*[@id="dt_purchase_call_button" and contains(@class, "btn-purchase--disabled")]       60
    Click element    dt_purchase_call_button
    Log to console     Test Completed





