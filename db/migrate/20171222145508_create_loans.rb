class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.text :lender
      t.text :borrower
      t.integer :principal
      t.integer :termLength
      t.integer :annualRate
      t.text :typeLoan
      t.text :frequencyPayment
      t.date :firstPaymentDate
      t.integer :StartingMonthDelayed
      t.references :schedule, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
