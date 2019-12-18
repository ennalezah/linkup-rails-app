class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.string :city
      t.string :state
      t.string :creator

      t.timestamps
    end
  end
end
