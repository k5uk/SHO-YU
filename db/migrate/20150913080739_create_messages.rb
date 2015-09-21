class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :uid1
      t.integer :uid2
      t.string :message

      t.timestamps
    end
  end
end
