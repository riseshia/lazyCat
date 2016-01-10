FactoryGirl.define do
  factory :log, class: Log do
    status 'MyString'
    message 'MyString'
    association :task, factory: :task
  end

  factory :fail_log, class: Log do
    association :task, factory: :task
    status 'fail'
    message 'MyString'
  end

  factory :ok_log, class: Log do
    association :task, factory: :task
    status 'ok'
    message 'MyString'
  end
end
