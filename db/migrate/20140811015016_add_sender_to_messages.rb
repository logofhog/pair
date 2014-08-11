class AddSenderToMessages < ActiveRecord::Migration
  def change
    change_table :messages do |t|
      t.integer :sender_id
    end
  end
end
