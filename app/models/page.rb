class Page < ActiveRecord::Base
	# associations
	  belongs_to :user
	# validations
		
end



# verify name
# inclusion must be about or contact
# presence true
# verify content
# presence