require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :vending_snacks}
    it {should have_many(:snacks).through(:vending_snacks)}
  end

  describe 'Instance methods' do
    before :each do
      @owner = Owner.create!(name: "Tylor")
      @machine = @owner.machines.create!(location: "123 Fake Street")
      @snack_1 = Snack.new(name: "snack", price: 1)
      @snack_2 = Snack.new(name: "other_snack", price: 2)
      @machine.snacks << @snack_1
      @machine.snacks << @snack_2
    end

    it "#average_snack_price will average the price of all snacks in machine" do
      expect(@machine.average_snack_price).to eq(1.5)
    end

    it "#snack_count will return the count of snack types in that machine" do
      expect(@machine.snacks_count).to eq(2)
    end
  end
end
