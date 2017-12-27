class Loan < ApplicationRecord
  belongs_to :user

  validates :lender, presence: true
  validates :borrower, presence: true
  validates :principal, presence: true
  validates :termLength, presence: true
  validates :annualRate, presence: true
  validates :typeLoan, presence: true
  validates :frequencyPayment, presence: true
  validates :firstPaymentDate, presence: true

end


