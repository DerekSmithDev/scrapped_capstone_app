class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :venue_id
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.integer :sales

      t.timestamps
    end
  end
end
