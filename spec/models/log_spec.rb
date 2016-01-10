require 'rails_helper'

RSpec.describe Log, type: :model do
  describe 'Active Record Validations' do
    it { should validate_presence_of(:task_id) }
  end

  describe 'Active Record Associations' do
    it { should belong_to(:task) }
  end
end
