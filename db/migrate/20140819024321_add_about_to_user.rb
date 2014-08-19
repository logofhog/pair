class AddAboutToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.text :about
    end
  end
end
