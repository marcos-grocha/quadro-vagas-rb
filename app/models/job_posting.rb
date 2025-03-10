class JobPosting < ApplicationRecord
  belongs_to :company_profile
  belongs_to :job_type
  belongs_to :experience_level
  has_rich_text :description

  enum :salary_currency, { usd: 0, eur: 10, brl: 20 }
  enum :salary_period, { daily: 0, weekly: 10, monthly: 20, yearly: 30 }
  enum :work_arrangement, { remote: 0, hybrid: 10, in_person: 20 }

  validates :title, :salary, :salary_currency, :salary_period, :company_profile, :job_type, :work_arrangement, presence: true
  validates :job_location, presence: true, if: -> { in_person? || hybrid? }
end
