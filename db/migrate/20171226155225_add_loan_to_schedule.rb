class AddLoanToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_reference :schedules, :loan, foreign_key: true
  end
end
