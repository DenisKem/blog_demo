class RateHandler < ApplicationHandler
  attr_accessor :rate, :post, :value
  validates :value, presence: true,
            numericality: { greater_than_or_equal_to: Rate::MIN_VALUE, less_than_or_equal_to: Rate::MAX_VALUE }

  def initialize(post, params)
    self.post = post
    super(params)
  end

  def main
    return unless valid?
    post.with_lock do
      create_rate
      post.update_average_rate!
    end
  end

  private

  def create_rate
    Rate.create!(post: post, value: value)
  end

  def permitted_params(params)
    params.permit(:value)
  end

  def serialize_resource
    PostRateSerializer.new(post)
  end
end