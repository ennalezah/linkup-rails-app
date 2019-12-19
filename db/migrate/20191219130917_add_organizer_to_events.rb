class AddOrganizerToEvents < ActiveRecord::Migration[6.0]
  def up
    add_column :events, :organizer, :integer
  end

  def down
    remove_column :events, :organizer
  end
end
