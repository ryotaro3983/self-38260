FactoryBot.define do
  factory :content do
    title { Faker::Commerce.product_name }
    genre { 'test' }
    memo { 'hoge' }

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.png')
    end

    association :user
  end
end
