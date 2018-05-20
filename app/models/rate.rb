class Rate < ApplicationRecord
  MIN_VALUE = 1
  MAX_VALUE = 5

  belongs_to :post
end
