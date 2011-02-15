Feature: Managing publications
	In order to manage publications
	As a teacher
	I want to add, edit and remove publications

	Scenario: Add publication
		Given I am a new, authenticated user
		When I go to the admin publications page
		And I fill in the following:
			| Współautorzy | Autor1, Autor2       |
			| Tytuł        | Testowa praca        |
			| Link         | http://www.google.pl |
		And I select "2010" from "Rok"
		And I press "Dodaj"
		Then I should see the following table rows:
			| Współautorzy   | Tytuł         | Rok  | Odnośnik             | Akcje       |
			| Autor1, Autor2 | Testowa praca | 2010 | http://www.google.pl | edytuj usuń |

	Scenario: Edit publication
		Given I am a new, authenticated user
			And the following publications:
				| teacher_id | co_authors     | title         | year | link                 |
				| 1          | Autor1, Autor2 | Testowa praca | 2010 | http://www.google.pl |
				| 1          | Autor3, Autor2 | Inna praca    | 2009 | http://www.rp.pl     |
		When I go to the admin publications page
		And I follow "edytuj" in row with "Testowa praca" within "publikacje_table" table
		And I fill in the following:
			| Współautorzy | Autor5                    |
			| Tytuł        | Inna testowa praca        |
			| Link         | http://www.maps.google.pl |
		And I select "2008" from "Rok"
		And I press "Edytuj"
		Then I should see the following table rows:
			| Współautorzy   | Tytuł              | Rok  | Odnośnik                  | Akcje       |
			| Autor5         | Inna testowa praca | 2008 | http://www.maps.google.pl | edytuj usuń |
			| Autor3, Autor2 | Inna praca         | 2009 | http://www.rp.pl          | edytuj usuń |
		And I should not see "2010" within "table#publikacje_table"
		And I should not see "Testowa praca"
		And I should not see "Autor1"

	Scenario: Remove publication
		Given I am a new, authenticated user
			And the following publications:
				| teacher_id | co_authors     | title         | year | link                 |
				| 1          | Autor1, Autor2 | Testowa praca | 2010 | http://www.google.pl |
				| 1          | Autor3, Autor2 | Inna praca    | 2009 | http://www.rp.pl     |
		When I go to the admin publications page
		And I follow "usuń" in row with "Testowa praca" within "publikacje_table" table
		Then there should be 1 publications
		And I should not see "Autor1"
		And I should not see "Testowa praca"