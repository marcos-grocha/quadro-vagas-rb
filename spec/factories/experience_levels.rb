FactoryBot.define do
  factory :experience_level do
    name { [ "Intern", "Junior", "Mid-level", "Senior" ].sample }
    status { :archived }
  end
end
