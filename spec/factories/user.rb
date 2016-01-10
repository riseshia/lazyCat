FactoryGirl.define do
  factory :user, class: User do
    email 'test1@user.com'
    password 'test1@user.com'
    provider 'github'
    uid '1231123'
  end
end
