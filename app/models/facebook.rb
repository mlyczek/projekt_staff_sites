class Facebook < ActiveRecord::Base
	belongs_to :teacher

	def post_to_wal(msg)
		unless self.access_token.nil? and self.profile_id.nil?
			require 'net/https'

			url = URI.parse("https://graph.facebook.com/#{self.profile_id}/feed")
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = (url.scheme == 'https')
			request = Net::HTTP::Post.new(url.path)
			request.set_form_data({'access_token' => self.access_token,
														'message' => msg}, '&')
			response = http.request(request)
		end
	end
end
