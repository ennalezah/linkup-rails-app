class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :details
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.string :city
      t.string :state
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
