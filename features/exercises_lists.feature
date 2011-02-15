Feature: Manage exercises list
	In order to manage exercises lists
	As a teacher
	I want to add, edit, remove exercises list

	Scenario: Add exercieses list
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
		When I go to the admin subjects page
		And I follow "Matematyka dyskretna"
		And I follow "Listy zadań"
		Then I should not see "Dodana lista zadań"

		When I follow "Dodaj listę zadań"
		And I fill in the following:
			| Numer           | 1                                         |
			| Termin oddania  | 20-02-2011                                |
			| Link do listy   | http://kno.ii.uni.wroc.pl/list.php?id=324 |
			| Dodatkowe uwagi | Dodana lista zadań                        |
		And I press "Dodaj"
		Then I should see "http://kno.ii.uni.wroc.pl/list.php?id..."
		And I should see "20-02-2011"
		And I should see "Dodana lista zadań"

	Scenario: Edit exercises list
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
			And the following exercises lists:
				| subject_id | nr | deadline   | exercises_files_list_id | url                    | comment            |
				| 1          | 1  | 2011-02-20 | nil                     | http://www.rp.pl       |                    |
				| 1          | 2  | 2011-02-23 | nil                     | http://www.rp.pl/lista | Lista w internecie |
		When I go to the admin subjects page
		And I follow "Matematyka dyskretna"
		And I follow "Listy zadań"
		And I follow "edytuj" in row with "20-02-2011" within "exercises_lists_table" table
		And I fill in "Termin oddania" with "2011-02-28"
		And I fill in "Dodatkowe uwagi" with "Zmieniona lista"
		And I press "Edytuj"
		Then I should see "Zmieniona lista"
		And I should see "28-02-2011"
		And I should not see "20-02-2011"

	Scenario: Remove exercises list
		Given I am a new, authenticated user
			And db has some subjects from teacher 1
			And the following exercises lists:
				| subject_id | nr | deadline   | exercises_files_list_id | url                    | comment            |
				| 1          | 1  | 2011-02-20 | nil                     | http://www.rp.pl       |                    |
				| 1          | 2  | 2011-02-23 | nil                     | http://www.rp.pl/lista | Lista w internecie |
		When I go to the admin subjects page
		And I follow "Matematyka dyskretna"
		And I follow "Listy zadań"
		And I follow "usuń" in row with "20-02-2011" within "exercises_lists_table" table
		Then I should not see "20-02-2011"