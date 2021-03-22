feature 'Sign up user', js: true do
	
	before(:all) do
	  random = SecureRandom.hex
	  username = 'Testuser' + random
	  password = 'test1234'
	  email = 'Testuser' + random + '@test.org'
	  creds = {username: "#{username}", password: "#{password}", email: "#{email}"}
	  File.open("./Test Data/creds.yml", "w") { |file| file.write(creds.to_yaml) }
	end

	after(:all) do
	  File.delete("./Test Data/creds.yml")
	end

	scenario 'User can sign up' do
	
	  visit ('http://testautomate.me/redmine/')
	  expect(page).to have_content 'Redmine@testautomate.me'
	  
	  creds = YAML.load(File.read("./Test Data/creds.yml"))
	  username = creds[:username]
      password = creds[:password]
      email = creds[:email]


	  find('.register').click
	  find('#user_login').set username
	  find('#user_password').set password
	  find('#user_password_confirmation').set password
	  find('#user_firstname').set 'test'
	  find('#user_lastname').set 'user'
	  find('#user_mail').set email
  
  	  find('#new_user > input:nth-child(4)').click
	  expect(page).to have_content "Logged in as #{username}"
	end


	scenario 'User can sign in' do
	
	  creds = YAML.load(File.read("./Test Data/creds.yml"))
	  username = creds[:username]
      password = creds[:password]
    

	  visit ('http://testautomate.me/redmine/')
	  expect(page).to have_content 'Redmine@testautomate.me'
	
	  find('.login').click
	  find('#username').set username
	  find('#password').set password
	  find('#login-submit').click
	  expect(page).to have_content "Logged in as #{username}"
	end
end