class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.text :lender
      t.text :borrower
      t.integer :principal
      t.integer :term_length
      t.integer :annual_rate
      t.text :type_loan
      t.text :frequency_payment
      t.datetime :first_payment_date
      t.integer :starting_month_delayed
      t.references :schedule, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
