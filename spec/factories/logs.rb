FactoryGirl.define do
  factory :log, class: Log do
    status 'MyString'
    message 'MyString'
    association :task, factory: :task
  end
end
