class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :rates

  scope :top, -> { order(average_rate: :desc) }

  def self.popular_author_ips(minimal_authors_count=2)
    joins(:author)
        .group(:author_ip)
        .select('posts.author_ip, array_agg(users.login) as logins')
        .having('count(users) >= :authors_count', authors_count: minimal_authors_count)
        .map { |p| {p.author_ip => p.logins} }
  end

  def update_average_rate!
    update!(average_rate: rates.average(:value))
  end
end
