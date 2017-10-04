class Property < ApplicationRecord
  has_many :product_properties
  has_many :products, :through => :product_properties

  validates :identifying_name,    presence: true, length: { maximum: 250 }, uniqueness: true
  validates :display_name,       presence: true, length: { maximum: 165 }, uniqueness: true

  def full_name
    "#{display_name}: (#{identifying_name})"
  end

  def display_active
    active? ? 'True' : 'False'
  end
end
