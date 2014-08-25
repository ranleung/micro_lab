class User < ActiveRecord::Base
	# associations
		has_many :pages
		has_many :posts
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
			:uniqueness => true


		# validates_confirmation_of :email
	 #  validates_presence_of :email_confirmation

end


# verify email
# confirmation (research it)
# presence
# uniqueness
# format with regex
# verify first_name and last_name
# presence