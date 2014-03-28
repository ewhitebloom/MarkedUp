class AddAddressToUsersTable < ActiveRecord::Migration
  def up
    add_column :users, :address, :string, null: false
  end

  def down
    remove_column :users, :address
  end
end
