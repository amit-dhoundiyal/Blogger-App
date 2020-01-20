class Post < ApplicationRecord
	has_many :comments,dependent: :destroy
	has_many :likes, dependent: :destroy
	belongs_to :user
	has_one_attached :image
end
