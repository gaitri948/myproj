*** Settings ***
Library  SeleniumLibrary
Resource   ../TestCases/sawgl.robot
Library  DataDriver  ../td/pyrobot.xlsx

Test Template  Test

*** Test Cases ***
SauceDemo


*** Keywords ***
Test
        LaunchBrowser
        [Arguments]  ${username}    ${password}
        username    ${username}
        password    ${password}
        Login button
        ${name_in_page}=  get element count  id:inventory_container
        run keyword if  ${name_in_page} > 0   Keyword1     ELSE   Keyword2

keyword1
    DropDown
    logout
    end
keyword2
    log to console  Invalid
    end