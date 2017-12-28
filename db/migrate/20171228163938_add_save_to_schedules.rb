class AddSaveToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :tokeep, :boolean, default: false
  end
end
