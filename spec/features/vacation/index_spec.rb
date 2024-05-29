require 'rails_helper'

RSpec.feature 'User can view his vacation orders' do
  given(:user) { create(:user) }
  given(:other_user) { create(:user) }
  given!(:user_vacation) { create_list(:vacation, 3, user: user) }
  given!(:other_user_vacation) { create_list(:vacation, 5, user: other_user) }

  it 'displays the correct number of user vacations' do
    sign_in user
    visit user_vacations_path(user)
    expect(page).to have_css('li', count: 3)
  end
  it 'displays the correct number of other_user vacations' do
    sign_in other_user
    visit user_vacations_path(other_user)
    expect(page).to have_css('li', count: 5)
  end
end
