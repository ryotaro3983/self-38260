FactoryBot.define do
  factory :review do
    comment {'test'}
    association :user
    association :content
  end

end
