class Product < ActiveRecord::Base

	has_many :comments
	belongs_to :category
	belongs_to :user

	default_scope -> { order(created_at: :desc) }
  	validates :user_id, presence: true
  	validates :category_id, presence: true
  	validates :description, presence: true
  	validates :name, presence: true
  	validates :price, presence: true
  	validates :phone_number, presence: true, length: { maximum: 15 }

end
