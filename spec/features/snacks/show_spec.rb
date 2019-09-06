require 'rails_helper'

describe 'Snack Show page' do
  before :each do
    @owner = Owner.create!(name: "Tylor")
    @machine = @owner.machines.create!(location: "123 Fake Street")
    @machine_2 = @owner.machines.create!(location: "666 Not Real Lane")
    @snack_1 = Snack.new(name: "snack", price: 1)
    @snack_2 = Snack.new(name: "other_snack", price: 2)
    @snack_3 = Snack.new(name: "snack the third", price: 3)
    @machine.snacks << @snack_1
    @machine.snacks << @snack_2
    @machine_2.snacks << @snack_1
    @machine_2.snacks << @snack_3
  end
  it "shows all info about that snack" do
    visit snack_path(@snack_1)

    expect(page).to have_content("Name: #{@snack_1.name}")
    expect(page).to have_content("Price: $#{@snack_1.price}")
    expect(page).to have_content(
      "Vending Locations:\n#{@machine.location} (2 kinds of snacks, average price of $#{@machine.average_snack_price}) #{@machine_2.location} (2 kinds of snacks, average price of $#{@machine_2.average_snack_price})")
  end
end
