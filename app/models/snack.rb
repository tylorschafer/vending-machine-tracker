class Snack < ApplicationRecord
  validates_presence_of :name, :price

  has_many :vending_snacks
  has_many :machines, through: :vending_snacks
end
