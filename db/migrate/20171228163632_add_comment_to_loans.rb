class AddCommentToLoans < ActiveRecord::Migration[5.1]
  def change
    add_column :loans, :comment, :text
  end
end
