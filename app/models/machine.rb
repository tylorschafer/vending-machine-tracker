class Machine < ApplicationRecord
  validates_presence_of :location

  belongs_to :owner
  has_many :vending_snacks
  has_many :snacks, through: :vending_snacks

  def average_snack_price
    snacks.average(:price)
  end

  def snacks_count
    snacks.count
  end
end
