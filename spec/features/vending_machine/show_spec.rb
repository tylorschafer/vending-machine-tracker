require 'rails_helper'

describe 'Vending Machine Show Page' do
  before :each do
    @owner = Owner.create!(name: "Tylor")
    @machine = @owner.machines.create!(location: "123 Fake Street")
    @snack_1 = Snack.new(name: "snack", price: 1)
    @snack_2 = Snack.new(name: "other_snack", price: 2)
    @snacks = [@snack_1, @snack_2]
    @machine.snacks << @snack_1
    @machine.snacks << @snack_2
  end
  it "Shows all snacks associated with that vending machine" do
    visit machine_path(@machine)

    @snacks.each do |snack|
      within "#snack-#{snack.id}" do
        expect(page).to have_content("Name: #{snack.name}")
        expect(page).to have_content("Price: $#{snack.price}")
      end
    end
  end
  it "Shows the average price for all snacks in that machine" do
    visit machine_path(@machine)

    expect(page).to have_content("Average Snack Price: $1.5")
  end
end
