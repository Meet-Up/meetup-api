class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.string :name
      t.string :password_digest
      t.integer :event_id

      t.timestamps
    end
  end
end
