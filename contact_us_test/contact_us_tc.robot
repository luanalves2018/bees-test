*** Settings  ***
Resource        resource.robot

*** Test Cases ***
Scenario 1
    Given User is on contact us page
    When Click in "Sim"
    And Choose consumer in the dropbox interest area
    And Choose sugestion in the radio button subject
    And Fill the field "nome" with "Luan Alves"
    And Fill the field "mensagem" with "Can you hire me for the job?"
    And Click in "Enviar"
    Then Website should show an alert about required fill email field