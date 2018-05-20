class V1::PostsController < ApplicationController
  def create
    respond_with PostHandler.perform(params)
  end

  def rate
    respond_with RateHandler.perform(Post.find(params[:id]), params)
  end
end