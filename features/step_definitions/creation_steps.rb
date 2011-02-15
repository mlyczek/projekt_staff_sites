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