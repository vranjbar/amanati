class Category < ActiveRecord::Base

	has_many :product
	validates :name, presence: true

	scope :get_id, lambda { |query| where(["categories.name LIKE ?",  "#{query}"] )}
end