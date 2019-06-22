class ArticlesController < ApplicationController
  
  def index
   @articles = Article.all.order("id Desc")
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
    article.update(title: params[:title],text: params[:text])
    redirect_to action: "index"
  end
  
end
