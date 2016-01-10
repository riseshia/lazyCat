require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'Active Record Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:period) }
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

  describe '#status' do
    it 'returns \'Not Triggered\'' do
      task = create(:task)
      expect(task.status).to eq('Not Triggered')
    end

    it 'returns \'ok\'' do
      log = create(:ok_log)
      expect(log.task.status).to eq('ok')
    end

    it 'returns \'fail\'' do
      log = create(:fail_log)
      expect(log.task.status).to eq('fail')
    end

    it 'returns \'Sleep\'' do
      log = create(:fail_log)
      log.created_at -= 1.day
      log.save
      expect(log.task.status).to eq('Sleep')
    end
  end
end
