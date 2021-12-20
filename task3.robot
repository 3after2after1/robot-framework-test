*** Settings ***
Library     SeleniumLibrary
Resource    keywords.robot
*** Variables ***
${login_btn}        dt_login_button
${email_field}      name=email
${login_oauth_btn}      //*[@class="button secondary"]

*** Keyword ***

*** Test Cases ***
Task 3 Buy Lower contract
    Login       ${my_email}     ${my_pw}
    Dropdown menu
    Wait until page contains element        //*[text()="Forex"]//parent::div[contains(@class,"sc-mcd__filter__item")]       40
    click element   //*[text()="Forex"]//parent::div[contains(@class,"sc-mcd__filter__item")]
    Wait until page contains element        //*[text()="Forex"]//parent::div[contains(@class,"sc-mcd__filter__item--selected")]    40
    Wait until page contains element    //*[text()="AUD/USD"]      40
    click element       //*[text()="AUD/USD"]
    Wait until page contains element    //*[text()="AUD/USD" and @class = "cq-symbol"]      20


    wait until page does not contain element    //*[@class="initial-loader initial-loader--fullscreen"]     20
    Wait until page contains element       //*[@name="contract_type" and contains(@value,"rise_fall")]      20
    click element   //*[@data-testid="dt_contract_dropdown"]
    wait until page contains element  //*[@data-testid="dt_contract_dropdown" and contains(@class, "contract-type-widget__display--clicked")]       20
    click element      //*[@value="high_low" and @class = "contract-type-item"]
    Wait until page contains element       //*[@name="contract_type" and contains(@value,"high_low")]      20
    Wait until page contains element    //*[@class = "dc-input__field" and @name = "duration" and @type = "number"]     20


    press keys       //*[@class = "dc-input__field" and @name = "duration" and @type = "number"]     BACKSPACE
    input text   //*[@class = "dc-input__field" and @name = "duration" and @type = "number"]     2
    click element   id=dc_payout_toggle_item
#    click element  //*[text()="Payout"]//parent::button[@id ="dc_payout_toggle_item")]
#    Wait until page contains element    //*[@id=dc_payout_toggle_item and contains(@class, "dc-button-menu__button--active")]       20
    press keys       //*[@id = "dt_amount_input" and @name = "amount" and @type = "tel"]     BACKSPACE
    press keys       //*[@id = "dt_amount_input" and @name = "amount" and @type = "tel"]     BACKSPACE
    input text    //*[@id = "dt_amount_input" and @name = "amount" and @type = "tel"]     15.50
    wait until page does not contain element         //*[@id = "dt_purchase_put_button" and contains(@class, "btn-purchase btn-purchase--disabled")]    20
    Click element   dt_purchase_put_button
    Log to console     Test Completed



