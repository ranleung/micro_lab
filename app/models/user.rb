class User < ActiveRecord::Base
	# associations 
		has_many :pages
		has_many :posts
	# validations 
		# validates :first_name, presence: true,
		# validates :last_name, presence: true,
		# validates :email, presence: true, 
		# uniqueness => true
end


# verify email
# confirmation (research it)
# presence
# uniqueness
# format with regex
# verify first_name and last_name
# presence