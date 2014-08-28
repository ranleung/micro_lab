class Comment < ActiveRecord::Base
  # associations
  # belongs_to :post

  #polymorphic association
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  # validations
	  validates :content, presence: true,
	  	:length => {:minimum=>3}
	  validates_length_of :content, {:maximum=>200}
end




# verify content
# length min, max
# presence