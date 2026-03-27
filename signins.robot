*** Settings ***
Library    SeleniumLibrary

#. Bejelentkezes ellenorzese
#- Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
#- Sikertelen bejelentkezes hibas jelszo eseten
#- Sikertelen bejelentkezes nem letezo felhasznaloval
#- Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
#- Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
#- Kijelentkezes utan vedett oldalak eleresenek tiltasa
#

*** Test Cases ***
Jo minden
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    meszaros.gergo@diak.szbi-pg.hu
    Input Password    locator=//*[@id="password"]    password=asdfasdf
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains    Kijelentkezés
    Close Browser

Hibas jelszo
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    meszaros.gergo@diak.szbi-pg.hu
    Input Password    locator=//*[@id="password"]    password=asdf
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains    text=Invalid
    Close Browser

Hibas felhasznalo
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    meszaros.gergo@diak.szbi-pg.hu
    Input Password    locator=//*[@id="password"]    password=asdf
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains    text=Invalid
    Close Browser

Ures mezok email
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    text=
    Input Password    locator=//*[@id="password"]    password=asdf
    Click Button    //*[@id="login-button"]
    Sleep    1s
    Page Should Not Contain    Profil
    Close All Browsers

Ures mezok jelszo
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    text=meszaros.gergo@diak.szbi-pg.hu
    Input Password    locator=//*[@id="password"]    password=
    Click Button    //*[@id="login-button"]
    Sleep    1s
    Page Should Not Contain    Kijelentkezés
    Close All Browsers

Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    meszaros.gergo@diak.szbi-pg.hu
    Input Password    locator=//*[@id="password"]    password=asdf
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains    text=Invalid email or password.
    Close Browser

Kijelentkezes utan vedett oldalak eleresenek tiltasa
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element    //*[@id="login-link"]
    Wait Until Page Contains Element    //*[@id="email"]
    Input Text    //*[@id="email"]    meszaros.gergo@diak.szbi-pg.hu
    Input Password    locator=//*[@id="password"]    password=asdfasdf
    Click Button    //*[@id="login-button"]
    Wait Until Page Contains   /html/body/div/nav/div[2]/div/div[1]/button
    Click Element    /html/body/div/nav/div[2]/div/div[1]/button
    Wait Until Page Contains Element    /html/body/div/nav/div[2]/div/div[1]/div/button[2]
    Click Button    /html/body/div/nav/div[2]/div/div[1]/div/button[2]
    Wait Until Page Contains Element    /html/body/div/main/div/div[1]/div/a[1]
    Page Should Not Contain Element    /html/body/div/nav/div[2]/div/a[1]
    Page Should Not Contain Element    //*[@id="cars-navbarlink"]
    Page Should Not Contain Element    /html/body/div/nav/div[2]/div/a[3]
    Page Should Not Contain Element    /html/body/div/nav/div[2]/div/a[4]
    Page Should Not Contain Element    /html/body/div/nav/div[2]/div/a[5]
    Close Browser
    
    