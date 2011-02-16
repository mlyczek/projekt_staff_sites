Feature: Managing timetable events
	In order to manage timetable events
	As a teacher
	I want to add timetable events

	Scenario: Add timetable event
		Given I am a new, authenticated user
			And db has event types
		When I go to the admin timetable page
		Then I should see "Plan zajęć"
		And I should see "Zajęcia w ii"
		And I should see "Zajęcia poza ii"
		And I should not see "Hobby"

		When I follow "Nowy typ"
		And I fill in "Nazwa" with "Hobby"
		And I choose "event_type_event_type_color_id_4"
		And I press "Dodaj"
		Then I should see "Hobby"
		And I should not see "Dodaj nowy typ"