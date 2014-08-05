class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :person_id
      t.boolean :unread
      t.boolean :sent
      t.string  :subject
      t.text    :body
      t.timestamps
    end
  end
end
