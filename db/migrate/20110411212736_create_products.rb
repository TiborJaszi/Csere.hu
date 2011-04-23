class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
		t.string :add_name
		t.integer :add_price
		t.string :add_pic
		t.timestamps
		t.integer :login_id
    end
  end

  def self.down
    drop_table :products
  end
end
