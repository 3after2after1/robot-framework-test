*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_btn}        dt_login_button
${email_field}      name=email
${login_oauth_btn}      //*[@class="button secondary"]

*** Keywords ***
Login
    [arguments]     ${hello_email}      ${hello_pw}
     open browser    https://app.deriv.com/     chrome
     Set Selenium Speed     0.2 seconds
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
     wait until page does not contain element   //*[aria-label="Loading interface..."]
     Wait until page contains element   //*[@class = "dc-icon"]     60
#     Switch to demo

Switch to demo
    Wait until page does not contain element    //*[@aria-label="Loading interface..."]   45
    click element    dt_core_account-info_acc-info
    Wait until page contains element        //*[text()="Real" and contains(@class,"active")]    20
    Wait until page contains element    //*[text()="Demo" and not(contains(@class,"active"))]   20
    click element   //*[@id="dt_core_account-switcher_demo-tab"]
    Wait until page contains element    //*[text()="Demo" and contains(@class,"active")]    20
    wait until page contains element  //*[text()="Demo"]//parent::span[contains(@class,"acc-switcher__id")]     15
    Click element   //*[text()="Demo"]//parent::span[contains(@class,"acc-switcher__id")]
#    Wait until page does not contain element    //*[text()="Retrieving Trading Times..." and contains(@class,"sc-loader-status")]       80
#    wait until page does not contain element    //*[@class="initial-loader initial-loader--fullscreen"]     60
    wait until page does not contain element   //*[@class="chart-container__loader"]    60

Dropdown menu
    wait until page does not contain element    //*[@aria-label="Loading interface..."]     30
    Wait until page contains element     //*[@class="cq-chart-price"]       60
    click element      //*[@class="cq-chart-price"]
    Wait until page contains element        //*[@class = "sc-dialog cq-menu-dropdown cq-menu-dropdown-enter-done"]      30
    sleep   3

Select high-low
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
    Wait until page contains element       //*[@name="contract_type" and contains(@value,"high_low")]       20
    Wait until page contains element    //*[@class = "dc-input__field" and @name = "duration" and @type = "number"]         20

Token API page
     click element      //*[@class = "dc-icon"]
     wait until page contains element   //*[@href="/account/personal-details" and contains(@class,"dc-vertical-tab__header--active")]
     click element   //*[@href="/account/api-token" and contains(@class, "dc-vertical-tab__header")]
     wait until page contains element       //*[@href="/account/api-token" and contains(@class, "dc-vertical-tab__header--active")]
     sleep 1
     wait until page does not contain element       //*[@class = "initial-loader account__initial-loader"]
     wait until page does not contain element   //*[@aria-label="Loading interface..."]

Verify checkbox
      [Arguments]    ${input}
       sleep   1
       click element      //*[@class="dc-checkbox__box"]//following-sibling::span[text()=${input}]
       sleep   1
       wait until page contains element  //*[@class="dc-checkbox__box dc-checkbox__box--active"]//following-sibling::span[text()=${input}]
       click element    //*[text()=${input}]
