class Teacher < ActiveRecord::Base
	has_one :profile, :dependent => :destroy
	has_one :facebook, :dependent => :destroy
	has_one :timetable, :dependent => :destroy
	has_many :consultations, :dependent => :destroy
	has_many :publications, :dependent => :destroy
	has_many :subjects, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login, :profile, :facebook

	after_create :create_profile
	after_create :create_timetable

	private
	def create_profile
		self.profile = Profile.create(self.id)
	end

	def create_timetable
		self.timetable = Timetable.create(:teacher_id => self.id, :modified => Time.now)
	end
end
