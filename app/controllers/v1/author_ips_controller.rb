class V1::AuthorIpsController < ApplicationController
  def index
    render json: AuthorIp.where("logins_count > 2")
  end
end