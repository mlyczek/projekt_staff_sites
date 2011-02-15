#
# File with steps that are creating some data to use in scenario
#

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