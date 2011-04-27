class CreateLogins < ActiveRecord::Migration
  def self.up
    create_table :logins do |t|
		t.string :firstname
		t.string :lastname
		t.string :email
		t.string :encrypted_password
		t.string :salt, :limit => 40
		t.integer :aktiv
		t.integer :permission, :default => 1
		t.timestamps
    end
  end

  def self.down
    drop_table :logins
  end
end
