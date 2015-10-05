class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :speaker_id
      t.integer :listener_id
      t.string :message

      t.timestamps
    end
  end
end
