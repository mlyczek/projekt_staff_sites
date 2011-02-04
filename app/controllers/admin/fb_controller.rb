class Admin::FbController < Admin::AdminController
  def connect
		if params[:code].nil?
			redirect_to "https://graph.facebook.com/oauth/authorize?client_id=152929901421850&"+
									"redirect_uri=http://smooth-dawn-29.heroku.com/admin/fb/connect&scope=offline_access,publish_stream"
		else
			require 'net/https'

			callback = "http://smooth-dawn-29.heroku.com/admin/fb/connect"
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

			current_teacher.facebook = Facebook.create( :profile_id   => user_data_obj['id'],
																									:profile_url  => user_data_obj['link'],
																									:access_token => access_token,
																								  :teacher_id   => current_teacher.id)
			
			flash[:notice] = 'Pomyślnie połączono z kontem na Facebook\'u'

			redirect_to :admin_root
		end
	end

	def disconnect
		current_teacher.facebook.destroy

		flash[:notice] = 'Pomyślnie rozłączono z kontem na Facebook\'u'

		redirect_ro :admin_root
	end
end
