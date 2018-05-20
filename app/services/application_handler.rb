class ApplicationHandler
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations

  def self.perform(params)
    new(params).tap(&:main)
  end

  def initialize(params)
    self.assign_attributes(params)
  end

  def as_json(*)
    if errors.present?
      {errors: errors}
    else
      {post: serialize_resource}
    end
  end
end