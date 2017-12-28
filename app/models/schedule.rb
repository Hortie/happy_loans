class Schedule < ApplicationRecord
  has_one :loan, dependent: :destroy

  def self.get_schedule(loan_id)
    Schedule.where(loan_id: loan_id).order(:no)
  end



end
