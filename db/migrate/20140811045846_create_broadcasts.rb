class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.string :message
      t.references :broadcaster
      t.integer :response_to_id
      t.timestamps
    end
  end
end
