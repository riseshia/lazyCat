FactoryGirl.define do
  factory :task, class: Task do
    name 'Task 01'
    token 'Blabla'
    period '3600'
    association :user, factory: :user
  end

  factory :invalid_task, class: Task do
    name 'Task 01'
    token 'Blabla'
    period 'sadf'
    association :user, factory: :user
  end
end
