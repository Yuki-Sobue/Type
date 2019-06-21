class ArticlesController < ApplicationController
  
  def index
   @articles = Article.all
  end
  
  def new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  

  def create
   Article.create(title: params[:title],text: params[:text])
   redirect_to action: "index"
  end
  
end
