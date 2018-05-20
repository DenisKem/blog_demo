class ApplicationHandler
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations

  def self.perform(*args)
    new(*args).tap(&:main)
  end

  def initialize(params)
    params = params.respond_to?(:permit) ? permitted_params(params) : params
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