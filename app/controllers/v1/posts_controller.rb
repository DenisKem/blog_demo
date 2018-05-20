class V1::PostsController < ApplicationController
  def create
    respond_with PostHandler.perform(params)
  end

  def rate
    respond_with RateHandler.perform(Post.find(params[:id]), params)
  end

  def top
    top_posts = Post.top.limit(params[:limit]).includes(:author)
    render json: top_posts, each_serializer: TopPostsSerializer
  end
end