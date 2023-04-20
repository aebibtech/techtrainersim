FactoryBot.define do
  factory :user do
    username { "noobmaster69" }
    password { "Noobmaster69!" }
    bio { "The quick brown fox jumps over the lazy dog." }
    stars { 1 }
    user_level { 1 }
    last_failed_login { "2023-04-20 15:10:26" }
  end
end
