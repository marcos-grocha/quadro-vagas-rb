class JobPosting < ApplicationRecord
  belongs_to :company_profile
  belongs_to :job_type

  validates :title, :salary, :salary_currency, :salary_period, presence: true
end
