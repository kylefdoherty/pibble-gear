FactoryGirl.define do
  factory :user do
    email "bob@gmail.com"
    password "brooklyn15"
    password_confirmation "brooklyn15"
    factory :admin_user do
      admin true
    end
  end
end
