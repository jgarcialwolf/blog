class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
    @user = @article.user
  end
  def new
    @article = Article.new
    @users = User.all
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      @users = User.all
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @article = Article.find(params[:id])
    @users = User.all
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      @users = User.all
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end
  private
  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
