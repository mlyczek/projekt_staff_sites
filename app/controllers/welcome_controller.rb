class WelcomeController < ApplicationController

	def index
		@teachers = Teacher.all
	end
end
