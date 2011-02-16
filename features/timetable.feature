Feature: Timetable managing
	In order to manage timetable
	As a teacher
	I want to add events

	Scenario: Add event
		Given I am a new, authenticated user
			And db has event types
		When I go to the admin timetable page
		And I follow "Dodaj nowe wydarzenie/zajęcia"
		And I fill in "Nazwa" with "Dodatkowe zajęcia"
		And I select "Zajęcia w ii" from "Typ"
		And I select "poniedziałek" from "Dzień tygodnia"
		And I fill in "event_start" with "10:00"
		And I fill in "event_end" with "12:00"
		And I fill in "Opis" with "Zajęcia dodatkowe na pozostałe pytania"
		And I press "Dodaj"
		Then I should see "Dodatkowe zajęcia"
		And I should not see "Dodaj wydarzenie/zajęcia"