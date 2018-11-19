class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.string :contact
      t.string :email
      t.string :phone
      t.integer :capacity

      t.timestamps
    end
  end
end
