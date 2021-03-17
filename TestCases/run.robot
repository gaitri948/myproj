*** Settings ***
Library  SeleniumLibrary
Resource   ../TestCases/tc0.robot
Library   DataDriver  ../td/pyrobot.xlsx


Test Template  valid Logins
Library  SeleniumLibrary
*** Test Cases ***
login with datadriven

*** Keywords ***
valid Logins
    open my browser
    [Arguments]  ${username}  ${password}
    input username  ${username}
    input password  ${password}
    sleep   3s
    Click Login Button
    capture page screenshot
    sleep   2s
Forloop
    @{items}    create list  pyrobot.xlsx
    : FOR ${tc}     IN      @{items}
    \   log to console  ${tc}
    \   exit for loop if  ${tc}==3

    close browser

#logout