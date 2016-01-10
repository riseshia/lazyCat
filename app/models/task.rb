# Task
class Task < ActiveRecord::Base
  belongs_to :user
  has_many :logs

  validates :user_id, presence: true
  validates :token, presence: true
  validates :name, presence: true
  validates :period, presence: true

  before_create do
    self.token = SecureRandom.hex(32)
  end

  def status
    log = logs.last
    if log
      working?(log) ? log.status : 'Sleep'
    else
      'Not Triggered'
    end
  end

  private

  def working?(log)
    log.created_at.to_i + period > Time.zone.now.to_i
  end
end
