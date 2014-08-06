# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name  'fred'
    zip_code '30338'
    email 'example@example.com'
    password 'password'
  end
end
