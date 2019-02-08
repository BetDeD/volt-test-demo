FactoryBot.define do
  factory :comment do
    body { "MyString" }
    author { nil }
    post { nil }
    comment { nil }
  end
end
