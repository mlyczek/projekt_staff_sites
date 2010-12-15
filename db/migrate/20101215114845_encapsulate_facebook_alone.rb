class EncapsulateFacebookAlone < ActiveRecord::Migration
  def self.up
		create_table :facebook do |t|
			t.string :profile_id
			t.string :profile_url
			t.string :access_token
		end

		remove_column :profiles, :fb_profile_url
		remove_column :profiles, :fb_profile_id
		remove_column :profiles, :fb_access_token
  end

  def self.down
		drop_table :facebook

		add_column :profiles, :fb_profile_url, :string
		add_column :profiles, :fb_profile_id, :string
		add_column :profiles, :fb_access_token, :string
  end
end
