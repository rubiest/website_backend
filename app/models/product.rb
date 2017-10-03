class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  belongs_to :user
  belongs_to :category

  default_scope -> { order('products.created_at DESC') }
  before_save :set_in_stock

  validates_presence_of :name, :quantity, :description, :default_price
  validates_numericality_of :quantity

  def should_generate_new_friendly_id?
    name_changed?
  end

  def set_in_stock
    if self.quantity.nil? || self.quantity == 0
      self.in_stock = false
    else
      self.in_stock = true
    end
  end
end