Feature: Profile edition
	In order to set degree, name and room
	As a teacher
	I want to fill this informations

	Scenario: Fill correct data and then edit it
		Given I am a new, authenticated user
		And I go to the admin home page
		Then I should see "Dane kontaktowe"

		When I fill in the following:
			| Imię i nazwisko | Test Teściński |
			| Nr pokoju       | 342            |
			| Telefon         | 348374         |
		And I select "mgr" from "Stopień naukowy"
		And I press "Zatwierdź"
		And I go to the home page
		Then I should see "Test Teściński"
		And I should see "342"

		Given I go to the admin home page
		And I fill in "Imię i nazwisko" with "Testor Testujący"
		And I press "Zatwierdź"
		And I go to the home page
		Then I should see "Testor Testujący"
		And I should not see "Test Teściński"

		