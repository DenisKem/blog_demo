class PostHandler < ApplicationHandler

  attr_accessor :author_ip, :author_login, :content, :title, :post
  validates :author_ip, :author_login, :content, :title, presence: true

  def main
    return unless valid?
    build_post
    set_author
    ApplicationRecord.transaction do
      post.save
      save_author_ip
    end
  end

  private

  def build_post
    self.post = Post.new.tap do |post|
      post.author_ip = author_ip
      post.content = content
      post.title = title
    end
  end

  def permitted_params(params)
    params.permit(:author_ip, :author_login, :content, :title)
  end

  def save_author_ip
    author_ip_record = AuthorIp.find_or_initialize_by(ip: author_ip)
    unless author_ip_record.logins.include?(author_login)
      author_ip_record.logins << author_login
      author_ip_record.increment(:logins_count)
    end
    author_ip_record.save!
  end

  def serialize_resource
    PostSerializer.new(post)
  end

  def set_author
    self.post.author = User.find_or_initialize_by(login: author_login)
  end
end