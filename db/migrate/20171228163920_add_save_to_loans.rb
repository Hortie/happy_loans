class AddSaveToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :tokeep, :boolean, default: false
  end
end
