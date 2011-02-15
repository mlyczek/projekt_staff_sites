Feature: Managing consultations
	In order to manage consultations
	As a teacher
	I want to add, edit and remove consultations

	Scenario: Add new consultations
		Given I am a new, authenticated user
		When I am on the admin home page
		And I follow "Konsultacje"
		Then I should see "Dodaj nowe konsultacje"

		When I select "wtorek" from "Dzień tygodnia"
		And I fill in "consultation_start" with "10:00"
		And I fill in "consultation_end" with "12:00"
		And I fill in "Uwagi" with "Konsultacje dla magistrantów"
		And I press "Dodaj"
		Then I should see the following table rows:
			| Dzień tygodnia | Godziny       | Uwagi                        | Działania   |
			| wtorek         | 10:00 - 12:00 | Konsultacje dla magistrantów | edytuj usuń |