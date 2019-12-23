class ChangeCreatorTypeOnGroups < ActiveRecord::Migration[6.0]
  def up
    change_column :groups, :creator, :integer
  end

  def down
    change_column :groups, :creator, :string
  end
end
