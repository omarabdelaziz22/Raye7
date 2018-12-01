class CreatePickups < ActiveRecord::Migration[5.2]
  def change
    create_table :pickups do |t|
      t.references :passenger, foreign_key: { to_table: :users }
      t.references :source, foreign_key: { to_table: :places }
      t.references :destination, foreign_key: { to_table: :places }
      t.datetime :departure_t

      t.timestamps
    end
  end
end
