class User < ActiveRecord::Base
	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false},
	email: true

	validates_presence_of :password, on: :create

	validates :name,
	presence: true,
	length: { maximum: 20, too_long: "%{count} characters is the maximum allowed"}

	has_secure_password

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
