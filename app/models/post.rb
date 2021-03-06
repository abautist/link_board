class Post < ActiveRecord::Base
  validates :title,
	presence: true,
	length: { 
		minimum: 10, 
		maximum: 100,
		too_short: "must have at least %{count} characters",
		too_long: "must have at most %{count} characters"
	}

	validates :link,
	presence: true,
	:url => true

  belongs_to :user
  has_many :comment

end
