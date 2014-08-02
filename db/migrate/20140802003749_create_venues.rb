class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :location
      t.float :drink_min
      t.float :ticket_price

      t.timestamps
    end
  end
end
