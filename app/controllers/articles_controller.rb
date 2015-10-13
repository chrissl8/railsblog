class ArticlesController < ApplicationController
  
  #view all articles
  def index
    @articles = Article.all
  end
  
  #show method to display articles
  def show
    @article = Article.find(params[:id])
  end
  
  #controller method for new articles
  def new
    @article = Article.new
  end
  
  #edit articles
  def edit
    @article = Article.find(params[:id])
  end
  
  #create method to create new articles
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  #update controller
  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  #delete/destroy action
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  
end
