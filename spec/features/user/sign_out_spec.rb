require 'rails_helper'

feature 'User can sign out', %q{
  As an athenticated user
  I'd like to be able to sign out.
} do

  given!(:user) { create(:user) }

  background { sign_in(user) }

  scenario 'user signs out' do
    visit root_path
    click_on 'Sign out'
    expect(current_path).to eq "/users/sign_in"
  end
end
