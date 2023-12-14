# Controllers are Ruby classes, and their public methods are actions.

class ArticlesController < ApplicationController
      # When the action is empty, i.e., when an action does not explicitly render a view (or otherwise trigger an HTTP response), Rails will automatically render a view that matches the name of the controller and action. Convention Over Configuration! Views are located in the app/views directory. So the index action will render app/views/articles/index.html.erb by default. 

  http_basic_authenticate_with name: "Shivank", password: "Shivank/indorE2023", except: [:home, :index, :show]
  
  before_action :get_article, only: [:show, :edit, :update, :destroy]    
  # skip_before_action :authenticate_user 


  def home
  
  end

  def index
    # @articles = Article.all
    @articles = Article.where(category: params[:key])
    # render json: @articles, eachhhhhhhhhh_serializer: ArticleSerializer
  end

  def show
    # @article = Article.find(params[:id])
    render "show"

    # @article = Article.find_by(id:1)
    # render json: @article, serializer: ArticleSerializer
  end

  def new
    @article = Article.new
    render "new"
  end

  def create
    # debugger
    @article = Article.new(article_params)    
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end

    # @article.save
    # render json: @article, serializer: ArticleSerializer
  end

  def edit
    # @article = Article.find(params[:id])
  end

  def update
    # @article = Article.find(params[:id])
    if @article.update(article_params)
      puts "Running UPDATE action in controller ================================"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path, status: :see_other

  end

  private
    def get_article
      @article = Article.find(params[:id])
    end
    def article_params
      params.require(:article).permit(:category, :title, :author, :body, :status)
    end
    #Strong Parameters (article_params in this case) is commonly used with the create and update actions to ensure that only the intended attributes can be modified (helping prevent unintentional or malicious modification of attributes). 

end
