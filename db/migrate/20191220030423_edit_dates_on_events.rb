class EditDatesOnEvents < ActiveRecord::Migration[6.0]
  def up
    change_column :events, :start_date, :date
    rename_column :events, :start_date, :date
    add_column :events, :start_time, :time

    change_column :events, :end_date, :time
    rename_column :events, :end_date, :end_time
  end

  def down
    rename_column :events, :date, :start_date
    change_column :events, :start_date, :datetime
    remove_column :events, :start_time
    
    rename_column :events, :end_time, :end_date
    change_column :events, :end_date, :datetime
  end
end
