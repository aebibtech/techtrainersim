FactoryBot.define do
  factory :learning_progress do
    user { create(:user) }
    activity { create(:activity) }
    current_step { 1 }
    is_completed { false }
  end
end
