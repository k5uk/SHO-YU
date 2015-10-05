class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :speaker_name, :string
    add_column :messages, :listener_name, :string
    add_column :messages, :read_flag, :integer
    add_column :messages, :subject, :string
  end
end
