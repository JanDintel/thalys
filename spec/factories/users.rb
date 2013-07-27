FactoryGirl.define do
  factory :user do
    email 'test@new.com'
    password 'lukethisisyourfather'
    password_confirmation 'lukethisisyourfather'
  end
end
