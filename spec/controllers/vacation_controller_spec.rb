require 'rails_helper'

RSpec.describe VacationsController, type: :controller do
  let(:user) { create(:user) }
  let(:vacation) { attributes_for(:vacation) }
  let(:invalid_attributes) { attributes_for(:vacation, end_date: '2023-01-01') }

  before { sign_in user }

  describe 'GET #index' do
    before { get :index, params: { user_id: user.id } }

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    before { get :new, params: { user_id: user.id } }

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      before { post :create, params: { user_id: user.id, vacation: vacation } }

      it 'saves the new vacation' do
        expect(Vacation.count).to eq(1)
      end
    end

    context 'with invalid params' do
      before { post :create, params: { user_id: user.id, vacation: invalid_attributes } }

      it 'does not save the new vacation' do
        expect(Vacation.count).to eq(0)
      end

      it 're-renders the new template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
