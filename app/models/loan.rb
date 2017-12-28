class Loan < ApplicationRecord
  belongs_to :user

  validates :lender, presence: true
  validates :borrower, presence: true
  validates :principal, presence: true
  validates :termLength, presence: true
  validates :annualRate, presence: true
  validates :typeLoan, presence: true
  validates :frequencyPayment, presence: true # monthly, trimestrial, semestrial, annualy
  validates :firstPaymentDate, presence: true


  def get_lastDueDate(loan_id)
    sched = Schedule.where(loan_id: loan_id).order(:no)
    return sched.last[:dueDate]
  end


end


