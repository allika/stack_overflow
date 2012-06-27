FactoryGirl.define do
  factory :user do
    first_name            "Alla"
    last_name             "Lisitskaya"
    username              "a.lisitskaya"
    email                 "a.lis@example.com"
    password              "password"
    password_confirmation "password"
  end
end