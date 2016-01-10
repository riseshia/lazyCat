FactoryGirl.define do
  factory :task, class: Task do
    name 'Task 01'
    token 'Blabla'
    period 3600
    association :user, factory: :user
  end

  factory :task_by_user2, class: Task do
    name 'Task 01'
    token 'Blabla'
    period 3600
    association :user, factory: :user2
  end

  factory :invalid_task, class: Task do
    name 'Task 01'
    token 'Blabla'
    period nil
    association :user, factory: :user
  end
end
