class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :partner_name, :string
    add_column :messages, :read_flag, :integer
    add_column :messages, :subject, :string
  end
end
