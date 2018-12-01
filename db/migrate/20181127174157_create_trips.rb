class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :driver, foreign_key: { to_table:  :users }
      t.references :source, foreign_key: { to_table:  :places }
      t.references :destination, foreign_key: { to_table:  :places }
      t.datetime :departure_t
      t.integer :seats

      t.timestamps
    end
  end
end
