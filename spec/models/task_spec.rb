require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Active Record Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:token) }
    it { should validate_presence_of(:name) }
  end

  describe 'Active Record Associations' do
    it { should belong_to(:user) }
    it { should have_many(:logs) }
  end

  describe 'Callback' do
    it 'has SecureRandom hex(64) after created' do
      task = create(:task)

      expect(task.token.size).to eq(64)
    end
  end
end

