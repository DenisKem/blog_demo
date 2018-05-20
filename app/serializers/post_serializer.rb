class PostSerializer < ApplicationSerializer
  attributes :author_ip, :content, :title
  belongs_to :author
end