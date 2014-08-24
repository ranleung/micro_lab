class Page < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true

  validates_format_of :name, :with => /(about|contact|About|Contact)/

  validates :content, presence: true
end
