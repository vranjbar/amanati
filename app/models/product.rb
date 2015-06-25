class Product < ActiveRecord::Base

  has_many :comments
  belongs_to :category
  belongs_to :user

    validates :user_id, presence: true
    validates :category_id, presence: true
    validates :description, presence: true
    validates :name, presence: true
    validates :price, presence: true
    validates :phone_number, presence: true, length: { maximum: 15 }

   scope :search_city, lambda { |query| where(["products.city LIKE ?", "%#{query}%"] )}
   scope :search_name, lambda { |query| where(["products.name LIKE ?",  "%#{query}%"] )}
   scope :under_price, lambda { |query| where(["products.price <= ?", "#{query}"])}
   scope :over_price, lambda { |query| where(["products.price >= ?", "#{query}"])}
   scope :before_date, lambda { |query| where(["products.created_at <= ?",  "#{query}"])}
   scope :after_date, lambda { |query| where(["products.created_at >= ?",  "#{query}"])}
   scope :search_category, lambda { |query| where(["products.category_id = ?",  "#{query}"])}

   # Order by
   scope :newest_first, lambda {order("products.created_at DESC")}
   scope :oldest_first, lambda {order("products.created_at ASC")}
   scope :lowest_price_first, lambda {order("products.price ASC")}
   scope :highest_price_first, lambda{order("products.price DESC")}
end