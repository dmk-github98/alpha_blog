class ArticlesController < ApplicationController
  # ----< SHOW >----
  def show
    # byebug
    @article = Article.find(params[:id])
  end
  # ----< INDEX >----
  def index
    @articles = Article.all
  end
  # ----< NEW >----
  def new
    @article = Article.new
  end
  # ----< CREATE >----
  def create
    #render plain: params[:article]
    #render plain: @article.inspect
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article saved successfully."
      #redirect_to article_path(@article) # long version
      redirect_to @article
    else
      render 'new'
    end
  end
  # ----< EDIT >----
  def edit
    @article = Article.find(params[:id])
  end
  # ----< UPDATE >----
  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article updated successfully."
      #redirect_to article_path(@article) # long version
      redirect_to @article
    else
      render 'edit'
    end
  end
  # ----< DESTROY >----
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:notice] = "Article deleted successfully."
      #redirect_to article_path(@article) # long version
      redirect_to articles_path
    else
      render 'destroy'
    end
  end
end
