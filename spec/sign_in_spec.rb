feature 'Sign in user', js: true do
	scenario 'User can sign in' do
	
	visit ('http://testautomate.me/redmine/')
	expect(page).to have_content 'Redmine@testautomate.me'
	
	# click_link 'Sign in'

	# fill_in 'username', with: 'test'
	# fill_in 'password', with: 'test1234'

	find('.login').click
	find('#username').set 'test'
	find('#password').set 'test1234'
	find('#login-submit').click
	expect(page).to have_content 'Loginned in as'



	sleep 3
	end
end