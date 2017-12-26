class Loan < ApplicationRecord
  belongs_to :schedule, dependent: :destroy
  belongs_to :user

  validates :lender, presence: true
  validates :borrower, presence: true
  validates :principal, presence: true
  validates :termLength, presence: true,  numericality: true
  validates :annualRate, presence: true, numericality: true
  validates :typeLoan, presence: true
  validates :frequencyPayment, presence: true
  validates :firstPaymentDate, presence: true
  validates :StartingMonthDelayed, numericality: true

end


