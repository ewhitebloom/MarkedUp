module Sign_In_Sign_Out

  def sign_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'
  end

  def sign_out(user)
    visit destroy_user_session_path
    click_on 'Sign Out'
  end

end
