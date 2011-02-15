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

	Scenario: Edit consultations
		Given I am a new, authenticated user
			And the following consultations:
				| day    | start               | end                 | comments                     | teacher_id |
				| wtorek | 2000-01-01 14:00:00 | 2000-01-01 16:00:00 | Konsultacje dla magistrantów | 1          |
				| środa  | 2000-01-01 10:00:00 | 2000-01-01 11:00:00 |                              | 1          |
				| piątek | 2000-01-01 09:00:00 | 2000-01-01 11:00:00 |                              | 1          |
		When I go to the admin consultations page
		And I follow "edytuj" in row with "wtorek" within "konsultacje_table" table
		And I select "poniedziałek" from "Dzień tygodnia"
		And I fill in "consultation_start" with "12:00"
		And I fill in "consultation_end" with "14:00"
		And I fill in "Uwagi" with "Konsultacje dla piszących pracę magisterską"
		And I press "Zmień"
		Then I should see the following table rows:
			| Dzień tygodnia | Godziny       | Uwagi                                       | Działania   |
			| poniedziałek   | 12:00 - 14:00 | Konsultacje dla piszących pracę magisterską | edytuj usuń |
			| środa          | 10:00 - 11:00 |                                             | edytuj usuń |
			| piątek         | 09:00 - 11:00 |                                             | edytuj usuń |
		And I should not see "wtorek" within "table#konsultacje_table"
		And I should not see "magistrantów"

	Scenario: Remove consultations
		Given I am a new, authenticated user
			And the following consultations:
				| day    | start               | end                 | comments                     | teacher_id |
				| wtorek | 2000-01-01 14:00:00 | 2000-01-01 16:00:00 | Konsultacje dla magistrantów | 1          |
				| środa  | 2000-01-01 10:00:00 | 2000-01-01 11:00:00 |                              | 1          |
				| piątek | 2000-01-01 09:00:00 | 2000-01-01 11:00:00 |                              | 1          |
		When I go to the admin consultations page
		And I follow "usuń" in row with "środa" within "konsultacje_table" table
		Then there should be 2 consultations
		And I should not see "środa" within "table#konsultacje_table"
		