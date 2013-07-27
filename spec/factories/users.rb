FactoryGirl.define do
  factory :user do
    email 'test@new.com'
    password 'theforce'
    password_confirmation 'theforce'
  end
end
