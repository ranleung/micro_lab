class Tag < ActiveRecord::Base
	has_many :post_tags
	has_many :posts, :through => :post_tags

	validates :name,
		:presence => true,
		:uniqueness => true,
		:length => {:minimum => 1, :maximum => 10},
		:format => {:with => /\A[a-z]+\Z/}

end




# verify name
# uniqueness
# presence
# max and min length
# format
# no spaces or special characters