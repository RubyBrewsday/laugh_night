class CreateComedians < ActiveRecord::Migration
  def change
    create_table :comedians do |t|
      t.string :name
      t.string :website

      t.timestamps
    end

    create_table :comedians_shows, id: false do |t|
      t.belongs_to :comedian
      t.belongs_to :show
    end
  end
end
