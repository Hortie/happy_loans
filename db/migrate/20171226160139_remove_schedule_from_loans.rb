class RemoveScheduleFromLoans < ActiveRecord::Migration[5.1]
  def change
    remove_reference :loans, :schedule, foreign_key: true
  end
end
