class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :integer
    add_column :users, :birthday, :string
    add_column :users, :area, :string
    add_column :users, :kiryoku, :string
    add_column :users, :comment, :string
    add_column :users, :email_publish, :integer
  end
end
