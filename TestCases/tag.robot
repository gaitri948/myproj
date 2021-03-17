*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  http://demowebshop.tricentis.com/

*** Keywords ***
Browser operation
    open browser    ${url}   ${browser}
    maximize browser window

select Option
    click link  xpath:/html/body/div[4]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a

Input Uname
    [Arguments]  ${username}
    input text  id:Email    ${username}


Input Pword
    [Arguments]  ${password}
    input password      id:Password      ${password}
Click log In btn
    select checkbox  RememberMe
    click link  xpath:/html/body/div[4]/div[1]/div[4]/div[2]/div/div[2]/div[1]/div[2]/div[2]/form/div[5]/input
    sleep  3s




*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Search Option
    input text  id:twotabsearchtextbox  samsung A51
    click element  nav-search-submit-button

Selecting Item
    click element  xpath://span[text()='Samsung Galaxy A51 (Blue, 8GB RAM, 128GB Storage) Without Offer']

Switching New Tab
    select window  title=Samsung Galaxy A51 (Blue, 8GB RAM, 128GB Storage) Without Offer: Amazon.in: Electronics
Switch old tab
    select window  title=Amazon.in : samsung A51
Add Cart
    click element  id:add-to-cart-button
    sleep  5s

close cart
    click element  id:attach-close_sideSheet-link
   # close browser
   close window



* Settings *
Library  SeleniumLibrary
Resource  ../test/amazonlogin.robot
Resource  ../test/amazonorder.robot
Library   DataDriver  ../data/pyrobot.xlsx


Test Template  login


* Test Cases *
WithDataDriven1

* Keywords *
login
    Browser operation
    select Option
    [Arguments]  ${username}  ${password}
    Input Uname  ${username}
    Input Pword  ${password}
    Click log In btn
    ${name_in_page}=  get element count  //*[@id="nav-cart-count"]
    run keyword if  ${name_in_page} > 0   Keyword1     ELSE   Keyword2

Keyword1
    log to console  Valid Credentials
    Search Option
    Selecting Item
    Switching New Tab
    Add Cart
    close cart
    Switch old tab
    mouse over  id:nav-link-accountList-nav-line-1
    click element  xpath://span[text()='Sign Out']
    capture page screenshot
    close browser

Keyword2
    log to console  Invald Credentials
    close browser



