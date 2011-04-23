class AddSaltToLogin < ActiveRecord::Migration
  def self.up
 	rename_column :logins, :password, :encrypted_password
    add_column :logins, :salt, :string, :limit => 40
  end

  def self.down
  	rename_column :logins, :encrypted_password, :password
    remove_column :logins, :salt
  end
end
