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
     Select high-low
     clear Input Field  //*[@name="duration"]
     Input Text  //*[@name="duration"]   2
     clear Input Field  //*[@id="dt_barrier_1_input"]
     Input Text  //*[@id="dt_barrier_1_input"]  +0.01
     wait until page contains    Contracts more than 24 hours in duration would need an absolute barrier.     60
     clear Input Field  //*[@id="dt_barrier_1_input"]
     Input Text  //*[@id="dt_barrier_1_input"]  0.71365
     wait until page does not contain element    //*[@id="dt_purchase_put_button" and contains(@class, "btn-purchase--disabled")]    60
     Click element    dt_purchase_put_button