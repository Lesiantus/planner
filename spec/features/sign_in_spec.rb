require 'rails_helper'

feature 'User can sign in', %q{
  in order to create new vacation plan
  as unauthenticated user
  i'd like to be able to sign in
} do
  before do
    User.create!(email: 'user@test12.com', password: '123456')
  end

  scenario 'Registered user tries to sign in' do
    expect(User.find_by(email: 'user@test12.com')).to be_present
    visit new_user_session_path
    fill_in 'Email', with: 'user@test12.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'User enters wrong data and tries to sign in' do
    visit new_user_session_path
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
end
