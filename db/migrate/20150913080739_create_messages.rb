class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :uid1
      t.integer :uid2
      t.string :uid1Msg
      t.timestamp :uid1MsgTime
      t.string :uid2Msg
      t.timestamp :uidMsgTime

      t.timestamps
    end
  end
end
