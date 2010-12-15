class PluralizeFacebookTableName < ActiveRecord::Migration
  def self.up
		rename_table :facebook, :facebooks
  end

  def self.down
		rename_table :facebooks, :facebook
  end
end
