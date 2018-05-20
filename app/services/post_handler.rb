class PostHandler
  include ActiveModel::AttributeAssignment
  include ActiveModel::Validations

  attr_accessor :author_ip, :author_login, :content, :title, :post
  validates :author_ip, :author_login, :content, :title, presence: true

  delegate :save, to: :post

  def self.perform(params)
    new(params).tap do |handler|
      if handler.valid?
        handler.build_post
        handler.set_author
        handler.save
      end
    end
  end

  def initialize(params)
    self.assign_attributes(params)
  end

  def build_post
    self.post = Post.new.tap do |post|
      post.author_ip = author_ip
      post.content = content
      post.title = title
    end
  end

  def set_author
    self.post.author = User.find_or_initialize_by(login: author_login)
  end

  def as_json(*)
    if errors.present?
      {errors: errors}
    else
      {post: PostSerializer.new(post, include: :author)}
    end
  end
end