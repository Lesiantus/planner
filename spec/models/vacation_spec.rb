require 'rails_helper'

RSpec.describe Vacation, type: :model do
  describe 'vacation' do
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should belong_to(:user) }
  end
end
