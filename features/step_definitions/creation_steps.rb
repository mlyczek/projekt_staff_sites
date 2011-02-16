#
# File with steps that are creating some data to use in scenario
#

# ----- consultations --------

Given /^the following consultations:$/ do |consultations|
	Consultation.create!(consultations.hashes)
	Then %{there should be #{consultations.hashes.length} consultations}
end

Then /^there should be (.*) consultations$/ do |n|
	if defined?(Spec::Rails::Matchers)
    Consultation.all.count.should == n.to_i
  else
    assert_equal n.to_i, Consultation.all.count
  end
end

# ----- publications --------

Given /^the following publications:$/ do |publications|
	Publication.create!(publications.hashes)
	Then %{there should be #{publications.hashes.length} publications}
end

Then /^there should be (.*) publications$/ do |n|
	if defined?(Spec::Rails::Matchers)
    Publication.all.count.should == n.to_i
  else
    assert_equal n.to_i, Publication.all.count
  end
end

# ----- subjects --------

Given /^the following subjects:$/ do |subjects|
	Subject.create!(subjects.hashes)
	Then %{there should be #{subjects.hashes.length} subjects}
end

Then /^there should be (.*) subjects$/ do |n|
	if defined?(Spec::Rails::Matchers)
    Subject.all.count.should == n.to_i
  else
    assert_equal n.to_i, Subject.all.count
  end
end

Given /^db has some subjects from teacher (.*)$/ do |teacher_id|
	Teacher.find(teacher_id).subjects.create!(:name => "Matematyka dyskretna",
																						:academic_year => "2010/2011",
																						:semester => "zimowy").hours.create!(:genre => "cw",
																																									:week_day => "wtorek",
																																									:start => "2000-01-01 14:00:00",
																																									:end => "2000-01-01 16:00:00",
																																									:room => "107")

	Teacher.find(teacher_id).subjects.create!(:name => "Analiza numeryczna",
																						:academic_year => "2010/2011",
																						:semester => "zimowy").hours.create!(:genre => "cw",
																																									:week_day => "środa",
																																									:start => "2000-01-01 10:00:00",
																																									:end => "2000-01-01 12:00:00",
																																									:room => "140")
end

# ----- exercises lists --------

Given /^the following exercises lists:$/ do |lists|
	ExercisesList.create!(lists.hashes)
	Then %{there should be #{lists.hashes.length} exercises lists}
end

Then /^there should be (.*) exercises lists$/ do |n|
	if defined?(Spec::Rails::Matchers)
    ExercisesList.all.count.should == n.to_i
  else
    assert_equal n.to_i, ExercisesList.all.count
  end
end

# ----- lectures --------

Given /^the following lectures:$/ do |lectures|
	Lecture.create!(lectures.hashes)
	Then %{there should be #{lectures.hashes.length} lectures}
end

Then /^there should be (.*) lectures$/ do |n|
	if defined?(Spec::Rails::Matchers)
    Lecture.all.count.should == n.to_i
  else
    assert_equal n.to_i, Lecture.all.count
  end
end

# ----- event types ------

Given /^db has event types$/ do
	EventTypeColor.create(:name => "Niebieski", :css_class => "ii_classes");
	EventTypeColor.create(:name => "Zielony", :css_class => "not_ii");
	EventTypeColor.create(:name => "Fioletowy", :css_class => "violet");
	EventTypeColor.create(:name => "Fioletowy 2", :css_class => "violet2");
	EventTypeColor.create(:name => "Czerwony", :css_class => "red");
	EventTypeColor.create(:name => "Żółty", :css_class => "yellow");
	EventTypeColor.create(:name => "Pomarańczowy", :css_class => "orange");

	EventType.create(:name => "Zajęcia w ii", :event_type_color_id => 1, :editable => false)
	EventType.create(:name => "Zajęcia poza ii", :event_type_color_id => 2, :editable => false)
end