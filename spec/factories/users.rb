# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'Test'
    last_name 'User'
    address '53 Ch Fox Run'
    address2 'RR#2'
    home_phone '8194594469'
    cell_phone '6146012344'
    city 'Wakefield'
    postal 'J0X3G0'
    home_ountry 'Canada'
    province 'Quebec'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end

