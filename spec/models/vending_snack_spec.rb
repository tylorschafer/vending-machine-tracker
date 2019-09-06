require 'rails_helper'

describe VendingSnack do
  describe 'Validations' do
    it {should belong_to :snack}
    it {should belong_to :machine}
  end
end
