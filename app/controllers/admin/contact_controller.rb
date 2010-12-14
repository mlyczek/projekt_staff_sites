class Admin::ContactController < Admin::AdminController
	def index
		@profile = current_teacher.profile
	end

	def update
		current_teacher.profile.update_attributes(params[:profile])
		redirect_to admin_root_path
	end

	def fb
		if params[:code].nil?
			redirect_to "https://graph.facebook.com/oauth/authorize?client_id=152929901421850&"+
									"redirect_uri=http://localhost:3000/admin/contact/fb&scope=offline_access,publish_stream"
		else
			require 'net/https'

			callback = "http://localhost:3000/admin/contact/fb"
			url = URI.parse("https://graph.facebook.com/oauth/access_token?client_id=152929901421850&"+
											"redirect_uri=#{callback}&client_secret=79612aa2f3328c985efe761697bbd511&code=#{CGI::escape(params[:code])}")
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = (url.scheme == 'https')
			tmp_url = url.path+"?"+url.query
			request = Net::HTTP::Get.new(tmp_url)
			response = http.request(request)
			data = response.body
			access_token = data.split("=")[1]

			url = URI.parse("https://graph.facebook.com/me?access_token=#{CGI::escape(access_token)}")
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = (url.scheme == 'https')
			tmp_url = url.path+"?"+url.query
			request = Net::HTTP::Get.new(tmp_url)
			response = http.request(request)
			user_data = response.body
			user_data_obj = JSON.parse(user_data)
			flash[:notice] = 'Facebook successfully connected.'

			profile = current_teacher.profile
			profile.update_attributes({:fb_profile_url => user_data_obj['link'],
																	:fb_profile_id => user_data_obj['id'],
																	:fb_access_token => access_token})
			current_teacher.profile = profile

			redirect_to :admin_root
		end
	end
end