class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.decimal :price, precision: 9, scale: 2

      t.timestamps
    end
  end
end
