class SignUpPage < SitePrism::Page
  
  section :menu, MenuSection, '#top_menu'

  element :login_fld, '#user_login'
  element :password_fld, '#user_password'
  element :password_confirmation_fld, '#user_password_confirmation'
  element :firstname_fld, '#user_firstname'
  element :lastname_fld, '#user_lastname'
  element :user_email_fld, '#user_mail'
  element :submit_btn, '#new_user > input:nth-child(4)'

end