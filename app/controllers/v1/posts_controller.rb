class V1::PostsController < ApplicationController
  def create
    post_params = params.permit(:author_ip, :author_login, :content, :title)
    respond_with PostHandler.perform(post_params)
  end
end