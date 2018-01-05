class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :no
      t.datetime :due_date
      t.integer :interest_due
      t.integer :principal_due
      t.integer :payment_due
      t.integer :principal_balance

      t.timestamps
    end
  end
end
