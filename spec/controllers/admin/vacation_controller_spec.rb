require 'rails_helper'

RSpec.describe Admin::VacationsController, type: :controller do
  let(:admin) { create(:admin) }
  let(:vacation) { create(:vacation) }
  let(:updated_attributes) { attributes_for(:vacation, status: 'Confirmed') }

  before { sign_in admin }

  describe 'GET #index' do
    before { get :index }

    it 'assigns all vacations to @vacations' do
      expect(assigns(:vacations)).to eq(Vacation.all)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      before { patch :update, params: { id: vacation.id, vacation: updated_attributes } }

      it 'updates the requested vacation' do
        vacation.reload
        expect(vacation.status).to eq('Confirmed')
      end

      it 'sends an email if the status is "Confirmed"' do
        expect(VacationStatusMailer).to receive(:approved_status).with(vacation).and_return(double(deliver_now: true))
        patch :update, params: { id: vacation.id, vacation: updated_attributes }
      end

      it 'sends an email if the status is "Declined"' do
        declined_attributes = attributes_for(:vacation, status: 'Declined')
        vacation.update(status: 'Declined')
        expect(VacationStatusMailer).to receive(:declined_status).with(vacation).and_return(double(deliver_now: true))
        patch :update, params: { id: vacation.id, vacation: declined_attributes }
      end
    end

    context 'with invalid params' do
      before { patch :update, params: { id: vacation.id, vacation: { status: '' } } }

      it 'does not update the vacation' do
        vacation.reload
        expect(vacation.status).not_to eq('')
      end
    end
  end
end
