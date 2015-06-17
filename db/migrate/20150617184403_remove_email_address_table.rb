class RemoveEmailAddressTable < ActiveRecord::Migration
  def change
    drop_table :email_addresses
  end
end
