class Comment < ActiveRecord::Base
  # associations 
	  belongs_to :post
  # validations 
	  validates :content, presence: true,
	  	:length => {:minimum=>3},
	  	:length => {:maximum=>100}
end




# verify content
# length min, max
# presence