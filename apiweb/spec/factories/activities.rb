FactoryBot.define do
  factory :activity do
    category { nil }
    activity_name { "MyString" }
    description { "MyText" }
    activity_image { "MyString" }
    reward { 1 }
  end
end
