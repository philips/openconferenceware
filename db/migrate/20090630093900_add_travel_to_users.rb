class AddTravelToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :needs_travel, :boolean, :default => false
  end

  def self.down
    remove_column :users, :needs_travel
  end
end
