require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Active Record Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:period) }
  end

  describe 'Active Record Associations' do
    it { should belong_to(:user) }
    it { should have_many(:logs) }
  end
end

