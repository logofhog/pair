# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body 'hey there'
    subject 'hello'
  end
end
