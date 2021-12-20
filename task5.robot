*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary
Resource    keywords.robot

*** Variables ***
${NUMBER_TO_PASS_ON}=    1
${dur}=  //*[@id="dt_amount_input"]
*** Keywords ***
clear Input Field
     [Arguments]    ${input}
     Wait until page contains element       ${input}    60
     ${curr_val}=    Get element attribute    ${input}    value
     ${length}=     Get Length     ${curr_val}
     Repeat keyword   ${length}    Press Keys   ${input}    BACKSPACE
     Repeat keyword   1    Press Keys   ${input}     DELETE
*** Test Cases ***
Open Deriv
     Login      ${my_email}     ${my_pw}
     Dropdown menu
     Wait until page contains element    //*[text()="Volatility 50 Index"]      20
     click element   //*[text()="Volatility 50 Index"]
     wait until page does not contain element    //*[@class="initial-loader initial-loader--fullscreen"]         80
     Wait until page contains element           //*[@class="trade-container__fieldset"]     60
     Click element      //*[@id="dt_contract_dropdown"]
     Wait until page contains element       //*[@id="dc_all_link"]      60
     Wait until page contains element       //*[@id="dt_contract_multiplier_item"]     60
     Click element      //*[@id="dt_contract_multiplier_item"]
     wait until page does not contain element       //*[@text()="Payout"]     60
     Wait until page contains element       //*[@id="dropdown-display"]     60

     Wait until page contains element   //*[@id="dt_amount_input_add"]   60
     Click element  //*[@id="dt_amount_input_add"]

     Wait until page contains element   //*[@id="dt_amount_input_sub"]   60
     Click element  //*[@id="dt_amount_input_sub"]

     Wait until page contains element   //*[@id="dropdown-display"]  60
     Click element  //*[@id="dropdown-display"]
     Wait until page contains element   //*[@id="20"]   60
     Click element  //*[@id="20"]

      Wait until page contains element   //*[@id="dropdown-display"]  60
     Click element  //*[@id="dropdown-display"]
     Wait until page contains element   //*[@id="40"]   60
     Click element  //*[@id="40"]

     Wait until page contains element   //*[@id="dropdown-display"]  60
     Click element  //*[@id="dropdown-display"]
     Wait until page contains element   //*[@id="60"]   60
     Click element  //*[@id="60"]

     Wait until page contains element   //*[@id="dropdown-display"]  60
     Click element  //*[@id="dropdown-display"]
     Wait until page contains element   //*[@id="100"]   60
     Click element  //*[@id="100"]

     Wait until page contains element   //*[@id="dropdown-display"]  60
     Click element  //*[@id="dropdown-display"]
     Wait until page contains element   //*[@id="120"]   60
     Click element  //*[@id="120"]


     Wait until page contains element       //*[text()="Deal cancellation"]
     Click element  //*[text()="Deal cancellation"]
