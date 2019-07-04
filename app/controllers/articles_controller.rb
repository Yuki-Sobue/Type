class ArticlesController < ApplicationController
  before_action :login_check ,except: [:index ,:show]

  def index
   @articles = Article.all.order("id Desc").page(params[:page]).per(10)
  end
  
  def new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  

  def create
   Article.create(title: articles_params[:title], text: articles_params[:text],user_id: current_user.id)
   redirect_to action: "index"
  end

  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to action: "index"
  end

  def update
    article = Article.find(params[:id])
    article.update(title: articles_params[:title], text: articles_params[:text],user_id: current_user.id)
    redirect_to action: "index"
  end

  def login_check
    redirect_to action: :index unless user_signed_in?
  end
  
  private
  def articles_params
    params.permit(:title,:text)
  end
end
