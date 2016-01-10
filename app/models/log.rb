# Log
class Log < ActiveRecord::Base
  belongs_to :task

  validates :task_id, presence: true

  before_create do |log|
    log.status = 'fail' unless log.status == 'ok'
    log.message = 'No Message' if log.message?
  end

  def self.create_with_param(params, task)
    Log.create(
      status: params['status'],
      message: params['message'],
      task_id: task.id
    )
  end

  def to_res
    {
      'status': status,
      'message': message
    }
  end
end
