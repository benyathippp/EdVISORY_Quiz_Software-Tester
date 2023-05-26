*** Settings ***
Library    SeleniumLibrary
Suite Setup     Open Browser    https://the-internet.herokuapp.com/   Chrome    maximize browser window
Test Teardown   Go To  https://the-internet.herokuapp.com/ 
Suite Teardown  Close Browser 


*** Test Cases ***
File Upload Test
    [Tags]    FileUpload
    Click Link    xpath=//*[@id="content"]/ul/li[18]/a
    Sleep    1s
    Choose File    id=file-upload    ${CURDIR}/data/data1.csv
    Click Button    id=file-submit
    Page Should Contain    File Uploaded!
    Sleep    1s
   

Multiple Windows Test
    [Tags]    MultipleWindows
    Click Link    xpath=//*[@id="content"]/ul/li[33]/a
    Sleep    1s
    Click Link    xpath=//*[@id="content"]/div/a
    Switch Window    NEW
    Page Should Contain    New Window
    Sleep    1s
    Close Window
    Switch Window    MAIN
    Sleep    1s
    # Capture Page Screenshot

Table Test
    Click Link    xpath=//*[@id="content"]/ul/li[41]/a
    # Maximize Browser Window
    ${data}=    Get Text    xpath=//*[@id="table1"]/tbody/tr[1]/td[5]
    ${columns}=    Get Element Count    xpath://*[@id="table1"]/tbody/tr[1]/td
    ${rows}=    Get Element Count    xpath://*[@id="table1"]/tbody/tr
    Table Header Should Contain    id=table2    Action
    Table Row Should Contain    class=web-site    3    http://www.jdoe.com
    Table Column Should Contain    class=header    5    Web Site
    Table Cell Should Contain    id=table2    5    2    Tim
    Sleep    1s

