class Teacher < ActiveRecord::Base
	has_one :profile
	has_many :consultations

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :profile

	after_create :create_profile

	private
	def create_profile
		self.profile = Profile.create(self.id)
	end
end
