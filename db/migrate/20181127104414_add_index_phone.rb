class AddIndexPhone < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :phone,                unique: true
  end
end
