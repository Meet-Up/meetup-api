class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.float :hours
      t.string :password_digest

      t.timestamps
    end
  end
end
