class PostSerializer < ApplicationSerializer
  attributes :author_ip, :average_rate, :content, :title
  belongs_to :author
end