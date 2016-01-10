class Task < ActiveRecord::Base
  belongs_to :user
  has_many :logs

  validates :user_id, presence: true
  validates :token, presence: true
  validates :name, presence: true
  validates_numericality_of :period

  before_create do
    self.token = SecureRandom.hex(32)
  end
end
