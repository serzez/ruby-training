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
	
	  creds = YAML.load(File.read("./Test Data/creds.yml"))
	  username = creds[:username]
      password = creds[:password]
      email = creds[:email]
      
      @home_page = HomePage.new
	  
	  @home_page.load
      expect(@home_page.header.text).to include 'Redmine@testautomate.me'

      @home_page.menu.sign_up_link.click

      @sign_up_page = SignUpPage.new

	  @sign_up_page.login_fld.set username
	  @sign_up_page.password_fld.set password
	  @sign_up_page.password_confirmation_fld.set password
	  @sign_up_page.firstname_fld.set 'test'
	  @sign_up_page.lastname_fld.set 'user'
	  @sign_up_page.user_email_fld.set email
  
      @sign_up_page.submit_btn.click
	  expect(@home_page.menu.logged_as.text).to include "Logged in as #{username}"

	#   visit ('http://testautomate.me/redmine/')
	#   expect(page).to have_content 'Redmine@testautomate.me'
	  
	#   creds = YAML.load(File.read("./Test Data/creds.yml"))
	#   username = creds[:username]
 #      password = creds[:password]
 #      email = creds[:email]


	#   find('.register').click
	#   find('#user_login').set username
	#   find('#user_password').set password
	#   find('#user_password_confirmation').set password
	#   find('#user_firstname').set 'test'
	#   find('#user_lastname').set 'user'
	#   find('#user_mail').set email
  
 #  	  find('#new_user > input:nth-child(4)').click
	#   expect(page).to have_content "Logged in as #{username}"
	
	end


	# scenario 'User can sign in' do
	
	#   creds = YAML.load(File.read("./Test Data/creds.yml"))
	#   username = creds[:username]
 #      password = creds[:password]
    

	#   visit ('http://testautomate.me/redmine/')
	#   expect(page).to have_content 'Redmine@testautomate.me'
	
	#   find('.login').click
	#   find('#username').set username
	#   find('#password').set password
	#   find('#login-submit').click
	#   expect(page).to have_content "Logged in as #{username}"
	# end
end