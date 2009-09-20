Feature: Note 

  So that I want to the details for a note
  As a web user
  I want to be able to easily recognize important details
  Scenario: Viewing a note                          
    Given the note_name                    
    When I view the note "1234567"                                                     
    Then I should see a  "Bad reputation"       
