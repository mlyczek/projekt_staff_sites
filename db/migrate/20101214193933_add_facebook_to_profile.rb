class AddFacebookToProfile < ActiveRecord::Migration
  def self.up
		add_column :profiles, :fb_profile_url, :string
		add_column :profiles, :fb_profile_id, :string
		add_column :profiles, :fb_access_token, :string
  end

  def self.down
		remove_column :profiles, :fb_profile_url
		remove_column :profiles, :fb_profile_id
		remove_column :profiles, :fb_access_token
  end
end
