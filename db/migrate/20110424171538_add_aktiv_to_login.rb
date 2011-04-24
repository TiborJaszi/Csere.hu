class AddAktivToLogin < ActiveRecord::Migration
  def self.up
    add_column :logins, :aktiv, :integer
  end

  def self.down
    remove_column :logins, :aktiv
  end
end
