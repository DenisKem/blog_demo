class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :rates

  scope :top, -> { order(average_rate: :desc) }

  def update_average_rate!
    update!(average_rate: rates.average(:value))
  end
end
