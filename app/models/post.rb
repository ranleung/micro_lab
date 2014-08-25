class Post < ActiveRecord::Base

	# associations 
	  belongs_to :user
	  has_many :post_tags, dependent: :destroy
	  has_many :tags, :through => :post_tags, dependent: :destroy
	  has_many :comments, dependent: :destroy
	  # has_many :comments, as: :commentable 

	# validations
		validates :title, presence: true, 
			:length => {:maximum=>25}
		validates :body, presence: true,
			:length => {:maximum=>250}

end



# verify title
# max length
# presence
# verify body
# max length < 250 characters (microblog!)
# presence
