class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.belongs_to :venue
      t.datetime :showtime
      t.timestamps
    end
  end
end
