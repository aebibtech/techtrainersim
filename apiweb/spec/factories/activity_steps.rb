FactoryBot.define do
  factory :activity_step do
    activity { build(:activity) }
    step_name { "Open Main Launchpad" }
    step_description { "Open the main launcher of your phone by swiping up." }
    step_image { "main_launchpad1.png" }
    step_number { 1 }
  end
end
