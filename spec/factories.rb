FactoryGirl.define do
  factory :completion do
    task
    completed_at { Time.current }
  end

  factory :task do
    sequence(:description) { |n| "task #{n}" }
    user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
  end
end
