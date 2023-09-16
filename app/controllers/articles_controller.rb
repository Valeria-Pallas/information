class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @article = Article.first
  end

  def show
    @article = Article.find(params[:id])
    @plant = Commentaire.new
    @plants = @article.commentaires
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:name, :banner_url, :description)
  end
end
