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
Go to Token API page
     Login      ${my_email}     ${my_pw}
     Token API page
     Log to console     Reached API token page

Select and unselect checkbox
    Verify checkbox     "Read"
    Verify checkbox     "Trade"
#    Verify checkbox     "Payments"
#    Verify checkbox     "Admin"
#    Verify checkbox     "Trading information"

Check for invalid input
    wait until page contains element    //*[text()="Please enter a token name."]
    wait until page contains element    //*[text()="Create"]//parent::button[@disabled]
    click element      //*[@class="dc-checkbox__box"]//following-sibling::span[text()="Read"]
    sleep   1
    wait until page contains element  //*[@class="dc-checkbox__box dc-checkbox__box--active"]//following-sibling::span[text()="Read"]       20
    input text      //*[@name="token_name"]        a
    wait until page contains element    //*[text()="Length of token name must be between 2 and 32 characters." and @class="dc-field dc-field--error"]     30
    clear Input Field        //*[@name="token_name"]
    input text        //*[@name="token_name"]       a@
    wait until page contains element    //*[text()="Only letters, numbers, and underscores are allowed."]     20
    clear Input Field        //*[@name="token_name"]
    input text        //*[@name="token_name"]        asd
    wait until page does not contain element    //*[text()="Length of token name must be between 2 and 32 characters." and @class="dc-field dc-field--error"]     20
    click element       //*[text()="Create"]//parent::button[@type="submit"]
    sleep   2
    wait until page contains element       //*[text()="Delete"]//parent::button[@type="button"]     20
    click element       //*[text()="Delete"]//parent::button[@type="button"]
    sleep   1
    wait until page contains element        //*[text()="Yes"]//parent::button[@type="button"]       20
    click element       //*[text()="Yes"]//parent::button[@type="button"]







