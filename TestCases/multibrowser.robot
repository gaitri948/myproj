*** Settings ***

Library  SeleniumLibrary
Library           Selenium2Library
Library           Collections
#Library           ExcelLibrary
Library           String


*** Variables ***
${delay}          2s
${excelName}      pyrobot.xlsx
${rowCount}       3
${cellCount}      7
${url}            https://www.flipkart.com/


*** Test Cases ***
ReadFromExcelSheet
    Open Excel Sheet    ${excelName}
    @{sheetNames}    Get Sheet Names
    ${sheetName}    Set Variable    @{sheetNames}[0]

    #: FOR    ${tc} IN RANGE  1
    \    Sleep    ${delay}
    \    Open Browser    ${url}     chrome
    \    Enter User Name    @{rowValues}[0]
    \    Enter Password     @{rowValues}[1]
    \    Click on Submit Button
    \    exit for loop if  ${tc}==3

*** Keywords ***


Get Values
    [Arguments]     ${username}     ${password}     ${tc}
    Log to console    user is in Get Values function

Enter User Name
       [Arguments]    ${username}
       click element  xpath://body/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/input[1]    ${username}


Enter Password
       [Arguments]   ${password}
       click element  xpath://body/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[2]/input[1]  ${password}

Click on Submit Button
       Click Button     xpath:/html/body/div[2]/div/div/div/div/div[2]/div/form/div[4]/button

       close browser


TestCase1
    open browser  ${URL}     chrome
    maximize browser window
click login button
    click element  xpath://a[contains(text(),'Login'
    [Arguments]  ${username}
    input text  type:text   ${username}

    [Arguments]  ${password}
    input text  type:password    ${password}
    close browser


    open browser  https://www.flipkart.com/     firefox
    maximize browser window
    [Arguments]  ${tc}

    input text

    close browser



