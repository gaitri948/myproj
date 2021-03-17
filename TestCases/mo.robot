*** Settings ***
Library  SeleniumLibrary


*** Test Cases ***
mouseactions

#right click
    open browser  https://www.saucedemo.com/    chrome
    maximize browser window

    open context menu  xpath://input[@id='login-button']
    sleep   3s

#double click
    go to   http://testautomationpractice.blogspot.com/
    maximize browser window
    double click element  xpath://button[contains(text(),'Copy Text')]
    sleep   2s
    # scroll page
    execute javascript  window.scrollTo(0,600)
    sleep   3s
    #scroll element into view    xpath://button[contains(text(),'Copy Text')]

# drag and drop
    go to   http://www.dhtmlgoodies.com/scripts/drag-drop-custom/demo-drag-drop-3.html
    maximize browser window
    drag and drop  id:box5  id:box105
    sleep   3s


# radio buttons and check buttons
    go to   http://www.practiceselenium.com/practice-form.html
    maximize browser window
    select radio button  sex    Female
    sleep   2s
    select radio button  exp    4
    sleep   3s

    select checkbox  BlackTea
    select checkbox     oolong tea
    sleep   1s
    unselect checkbox  BlackTea
    sleep   2s
    close browser

