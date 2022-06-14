*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}      https://www.ambev.com.br/contato/
${DEFAULT_TIMEOUT}      5
${BT_CLOSE_COOKIES_AREA}        //div[@id="onetrust-close-btn-container"]/button
${BT_YES}       class:age-gate-dialog__answer-button
${BT_YES_TEXT}
${LIST_INTEREST_AREA}      area-of-interest
${CONSUMER_OPTION_LIST}     1
${RB_SUGESTION_OPTION}       //*[@id="assunto"]/span[5]/label/span
${FIELD_ERROR_MESSAGE}      email-error
${ERROR_MESSAGE}        Este campo é requerido.

*** Keywords ***
User is on contact us page
    Open Browser     ${URL}       ${BROWSER}
    Maximize Browser Window
    Click to close cookies area
    Contact us should be ready

Contact us should be ready
    Element Should Contain    ${BT_YES}   ${BT_YES_TEXT}
    Cookie area should not more present

Click to close cookies area
    Click button   ${BT_CLOSE_COOKIES_AREA}     
    
Cookie area should not more present
    Wait Until Element Is Not Visible       ${BT_CLOSE_COOKIES_AREA}        ${DEFAULT_TIMEOUT}

Click in "${BUTTON}"
    Click button    ${BUTTON}

Choose consumer in the dropbox interest area
    Select From List By Index       ${LIST_INTEREST_AREA}       ${CONSUMER_OPTION_LIST}

Choose sugestion in the radio button subject
    Click Element     ${RB_SUGESTION_OPTION}

And Fill the field "${field_name}" with "${field_value}"
    Input Text      ${field_name}       ${field_value}

Website should show an alert about required fill email field
    Element Should Contain      ${FIELD_ERROR_MESSAGE}      ${ERROR_MESSAGE}
    [Teardown]      Close Browser  