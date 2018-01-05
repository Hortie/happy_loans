class Loan < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy

  validates :lender, presence: true
  validates :borrower, presence: true
  validates :principal, presence: true
  validates :term_length, presence: true
  validates :annual_rate, presence: true
  validates :type_loan, presence: true
  validates :frequency_payment, presence: true # monthly, trimestrial, semestrial, annualy
  validates :first_payment_date, presence: true


  def get_lastDueDate(loan_id)
    sched = Schedule.where(loan_id: loan_id).order(:no)
    return sched.last[:due_date]
  end


end


