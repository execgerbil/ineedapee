FactoryGirl.define do

  factory :washroom do
    association :user, factory: :user
    sequence(:name) {|n| "#{Faker::Company.name} #{n}"}
    sequence(:address) {|n| "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.postcode} #{n}"}
    #add lat n log here to make geocoder work
    
  end
  
end