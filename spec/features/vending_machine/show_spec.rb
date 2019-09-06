require 'rails_helper'

describe 'Vending Machine Show Page' do
  before :each do
    @owner = Owner.create!(name: "Tylor")
    @machine = @owner.machines.create!(location: "123 Fake Street")

  end
  it "Shows all snacks associated with that vending machine" do

  end
end
