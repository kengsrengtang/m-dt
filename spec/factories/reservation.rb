FactoryGirl.define do
  factory :reservation do
    first_name 'foo'
    last_name 'bar'
    phone_number '123'
    special_need 'special needs'
    vehicle_info 'toyota lexus'
    status 0
  end
end
