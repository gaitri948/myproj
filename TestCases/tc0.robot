*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  chrome

*** Keywords ***
Open My Browser
    open browser    ${url}   ${browser}
    maximize browser window

Input Username
    [Arguments]  ${username}
    input text  id:user-name    ${username}

Input Password
    [Arguments]  ${password}
    input text  id:password      ${password}

Click Login Button
    click element  xpath://*[@id="login-button"]
logout
    click element  id:react-burger-menu-btn
    click element  xpath:/html/body/div/div/div/div[1]/div[1]/div/div[3]/div[1]/nav/a[3]
Close Browser
    close all browsers

