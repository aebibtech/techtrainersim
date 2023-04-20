FactoryBot.define do
  factory :activity do
    category { build(:category) }
    activity_name { "Taking a picture" }
    description { "This learning activity will teach you how to take pictures using your Android phone." }
    activity_image { "taking-a-picture.png" }
    reward { 10 }
  end
end
