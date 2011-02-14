# Plik z definicjami kroków dla biblioteki devise

Given /^I am not authenticated$/ do
  visit('/teachers/sign_out')
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)" and login "([^\"]*)"$/ do |email, password, login|
	Teacher.create( :email => email,
									:login => login,
									:password => password,
									:password_confirmation => password)
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  login = 'testing_man'
  password = 'secretpass'

  Given %{I have one user "#{email}" with password "#{password}" and login "#{login}"}
  And %{I go to the login page}
  And %{I fill in "teacher_login" with "#{login}"}
  And %{I fill in "teacher_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I am signed in as testing user$/ do
  login = 'testing_man'
  password = 'secretpass'

	Given %{I go to the login page}
  And %{I fill in "teacher_login" with "#{login}"}
  And %{I fill in "teacher_password" with "#{password}"}
  And %{I press "Sign in"}
end