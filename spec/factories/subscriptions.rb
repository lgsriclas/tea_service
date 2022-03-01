FactoryBot.define do
  factory :subscription do
    customer
    title { Faker::Lorem.word }
    price { Faker::Number.decimal(l_digits: 2) }
    status { Faker::Subscription.status }
    frequency { Faker::Subscription.payment_term }
  end
end