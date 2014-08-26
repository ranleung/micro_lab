class User < ActiveRecord::Base

	has_secure_password

	# associations
		has_many :pages, dependent: :destroy
		has_many :posts, dependent: :destroy
	# validations
		# validates :first_name, presence: true
		# validates :last_name, presence: true
		# validates :email, presence: true,
		# uniqueness => true

		validates :first_name,
			:presence => true

		validates :last_name,
			:presence => true

		validates :email,
			:confirmation => true,
			:presence => true,
			:uniqueness => true,
			:length => {:minimum => 6}

		validates_format_of :email, :with =>/(\w*[@]\w*[.]\w*)/

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate,password)

	end

end


# verify email
# confirmation (research it)
# presence
# uniqueness
# format with regex
# verify first_name and last_name
# presence