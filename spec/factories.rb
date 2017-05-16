FactoryGirl.define do
  factory :task do
    description "A TODO item"
    user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
  end
end
