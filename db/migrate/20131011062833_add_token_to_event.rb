class AddTokenToEvent < ActiveRecord::Migration
  def change
    add_column :events, :token, :string
    add_index :events, :token
  end
end
