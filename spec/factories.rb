FactoryGirl.define do

  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password "password"
    password_confirmation { password }
  end

  factory :post do
    description "Description."
    title "Post Title"
  end

end
