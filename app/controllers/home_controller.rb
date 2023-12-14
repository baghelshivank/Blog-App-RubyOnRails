class HomeController < ApplicationController

  skip_before_action :authenticate_user 

  def home
    # byebug
    # @article = Article.find_by(params[:id])
    # render json: @article, eachhhhhhhhhh_serializer: HomeSerializer
  end
  def index
  end
end
