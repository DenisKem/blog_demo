class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :rates

  def update_average_rate!
    update!(average_rate: rates.average(:value))
  end
end
