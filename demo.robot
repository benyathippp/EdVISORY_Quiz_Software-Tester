*** Settings ***
Library         SeleniumLibrary

Suite Setup     Open Browser     https://the-internet.herokuapp.com/    Chrome    maximize browser window
Test Teardown   Go To            https://the-internet.herokuapp.com/
Suite Teardown  Close Browser


*** Test Cases ***
File Upload Test
    [Tags]    FileUpload
    Click Link             xpath=//*[@id="content"]/ul/li[18]/a    # คลิกที่ลิงก์ "File Upload"
    Sleep                  1s
    Choose File            id=file-upload    ${CURDIR}/data/data.csv    # เลือกไฟล์ที่จะอัปโหลด
    Click Button           id=file-submit    # คลิกที่ปุ่ม "Submit"
    Page Should Contain    File Uploaded!    # ตรวจสอบว่าหน้าจอแสดงข้อความ "File Uploaded!"
    Capture Page Screenshot
    Sleep                  1s


Multiple Windows Test
    [Tags]    MultipleWindows
    Click Link             xpath=//*[@id="content"]/ul/li[33]/a    # คลิกที่ลิงก์ "Multiple Windows"
    Sleep                  1s
    Click Link             xpath=//*[@id="content"]/div/a    # คลิกที่ลิงก์ "Click Here"
    Switch Window          NEW    # เปลี่ยนไปยังหน้าต่างใหม่
    Page Should Contain    New Window    # ตรวจสอบว่าหน้าต่างใหม่ปรากฏขึ้น
    Sleep                  1s
    Close Window    # ปิดหน้าต่างใหม่
    Switch Window          MAIN    # เปลี่ยนกลับไปยังหน้าต่างหลัก
    Sleep                  1s
 


Table Test
    [Tags]    TableTest
    Click Link                   xpath=//*[@id="content"]/ul/li[41]/a    # คลิกที่ลิงก์ "Sortable Data Tables"
    ${data}                      Get Text               xpath=//*[@id="table1"]/tbody/tr[1]/td[5]    # ดึงข้อมูลที่ต้องการ
    ${columns}                   Get Element Count      xpath://*[@id="table1"]/tbody/tr[1]/td    # นับจำนวนคอลัมน์
    ${rows}                      Get Element Count      xpath://*[@id="table1"]/tbody/tr    # นับจำนวนแถว
    Table Header Should Contain  id=table2              Action    # ตรวจสอบว่าส่วนหัวตารางมีข้อความ "Action"
    Table Row Should Contain     class=web-site         3         http://www.jdoe.com    # ตรวจสอบว่าแถว มีข้อมูลที่ต้องการ
    Table Column Should Contain  class=header           5         Web Site    # ตรวจสอบว่าคอลัมน์ มีข้อมูลที่ต้องการ
    Table Cell Should Contain    id=table2              5         2         Tim    # ตรวจสอบว่าเซลล์ มีข้อมูลที่ต้องการ 
    Sleep                        1s
