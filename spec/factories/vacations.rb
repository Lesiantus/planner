FactoryBot.define do
  factory :vacation do
    start_date { '2024-01-01' }
    end_date { '2024-01-05' }
    user
  end
end
