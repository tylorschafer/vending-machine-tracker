require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :vending_snacks}
    it {should have_many(:snacks).through(:vending_snacks)}
  end
end
