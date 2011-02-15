Feature: Show subject hours types in list table
	In order to keep subjects table clean
	As a teacher
	I want to see each hour type only once

	Scenario: Add second ćwiczenia hour
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
		When I go to the admin subjects page
		Then I should see the following table rows:
			| Nazwa                | Zajęcia   | Akcje       |
			| Matematyka dyskretna | ćwiczenia | edytuj usuń |
			| Analiza numeryczna   | ćwiczenia | edytuj usuń |

		When I follow "Matematyka dyskretna"
		Then I should see "Matematyka dyskretna"
		And I should see "Rok akademicki: 2010/2011"
		And I should see "Semestr: zimowy"
		And I should see "Terminy zajęć"
		Then I should see the following table rows:
			| Typ       | Dzień tygodnia | Godzina       | Sala | Działania   |
			| ćwiczenia | wtorek         | 14:00 - 16:00 | 107  | usuń edytuj |

		When I follow "Dodaj termin"
		And I select "ćwiczenia" from "Typ"
		And I select "poniedziałek" from "Dzień tygodnia"
		And I fill in "hour_start" with "08:00"
		And I fill in "hour_end" with "10:00"
		And I select "141" from "Sala"
		And I press "Dodaj"
		Then I should see the following table rows:
			| Typ       | Dzień tygodnia | Godzina       | Sala | Działania   |
			| ćwiczenia | wtorek         | 14:00 - 16:00 | 107  | usuń edytuj |
			| ćwiczenia | poniedziałek   | 08:00 - 10:00 | 141  | usuń edytuj |

		When I go to the admin subjects page
		Then I should see the following table rows:
			| Nazwa                | Zajęcia   | Akcje       |
			| Matematyka dyskretna | ćwiczenia | edytuj usuń |
			| Analiza numeryczna   | ćwiczenia | edytuj usuń |