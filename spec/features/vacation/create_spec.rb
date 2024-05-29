require 'rails_helper'


feature 'User can create new vacation', %q{
  Authenticated user can create his new vacation order
} do

  given(:user) { create(:user) }
  given(:admin) { create(:admin) }

  describe 'Authenticated user' do
    background do
      sign_in(user)
      visit root_path
    end

    scenario 'page displays the vacation form' do
      sign_in(user)
      click_on 'New'

      expect(page).to have_button('Create vacation')
      expect(page).to have_selector('label', text: 'Start date')
      expect(page).to have_selector('label', text: 'End date')
    end
    scenario 'user can create new vacation' do
      click_on 'New'
      fill_in 'vacation_start_date', with: '2024-01-01'
      fill_in 'vacation_end_date', with: '2024-01-05'
      click_on 'Create vacation'

      expect(page).to have_content 'Request created'
    end
    scenario 'user can not create new vacation with end date before start date' do
      click_on 'New'
      fill_in 'vacation_start_date', with: '2024-01-06'
      fill_in 'vacation_end_date', with: '2024-01-05'
      click_on 'Create vacation'

      expect(page).to have_content 'End date должна быть после даты начала отпуска'
    end
    scenario 'admin can not create vacation request' do
      sign_in(admin)
      visit root_path
      expect(page).to_not have_content 'New'
    end
  end
end
