Feature: Manage lectures
	In order to manage lectures
	As a teacher
	I want to add, edit, remove lectures

	Scenario: Add lecture
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
		When I go to the admin subjects page
		And I follow "Matematyka dyskretna"
		And I follow "Wykłady"
		Then I should not see "Wykład organizacyjny"

		When I follow "Dodaj nowy wykład"
		And I fill in the following:
			| Numer           | 1                    |
			| Tytuł           | Wykład organizacyjny |
			| Data wykładu    | 05-10-2010           |
			| Opis wykładu    | Sprawy organizacyjne |
		And I press "Dodaj"
		Then I should see "Wykład organizacyjny"
		And I should see "2010-10-05"
		And I should see "Sprawy organizacyjne"

	Scenario: Edit lecture
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
			And the following lectures:
				| subject_id | nr | title                | date       | abstract                   |
				| 1          | 1  | Wykład organizacyjny | 2010-10-05 | Sprawy organizacyjne       |
				| 1          | 2  | Drugi wykład         | 2010-10-12 | Wprowadzenie do matematyki |
		When I go to the admin subjects page
		And I follow "Matematyka dyskretna"
		And I follow "Wykłady"
		And I follow "edytuj" in row with "2010-10-05" within "lectures_table" table
		And I fill in "Tytuł" with "Zmieniony"
		And I press "Edytuj"
		Then I should see "Zmieniony"
		And I should not see "Wykład organizacyjny"

	Scenario: Remove lecture
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
			And the following lectures:
				| subject_id | nr | title                | date       | abstract                   |
				| 1          | 1  | Wykład organizacyjny | 2010-10-05 | Sprawy organizacyjne       |
				| 1          | 2  | Drugi wykład         | 2010-10-12 | Wprowadzenie do matematyki |
		When I go to the admin subjects page
		And I follow "Matematyka dyskretna"
		And I follow "Wykłady"
		And I follow "usuń" in row with "2010-10-05" within "lectures_table" table
		Then I should not see "Wykład organizacyjny"