class VendingSnack < ApplicationRecord
  belongs_to :machine
  belongs_to :snack
end
