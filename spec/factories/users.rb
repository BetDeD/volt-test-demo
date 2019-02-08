FactoryBot.define do
  factory :user do
    nickname { "My Title" }
    email { "my@email" }
    password { "My Password" }
  end

  factory :wrong_user, class: User do
    nickname { "My Title" }
    email { "" }
    password { "My Password" }
  end
end
