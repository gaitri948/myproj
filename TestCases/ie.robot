*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}      http://demowebshop.tricentis.com/

*** Keywords ***
Browser operation
    open browser    ${url}   ${browser}
    maximize browser window

select Option
    click link  xpath:/html/body/div[4]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a



