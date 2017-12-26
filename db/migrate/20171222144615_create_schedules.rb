class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.integer :no
      t.date :dueDate
      t.integer :interestDue
      t.integer :principalDue
      t.integer :paymentDue
      t.integer :principalBalance

      t.timestamps
    end
  end
end
