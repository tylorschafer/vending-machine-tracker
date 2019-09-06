require 'rails_helper'

describe Snack do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :price}
    it {should have_many :vending_snacks}
    it {should have_many(:machines).through(:vending_snacks)}
  end
end
