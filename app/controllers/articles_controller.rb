class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @articles = Article.all
    @commentaires = current_user.commentaires
  end

  def show
    puts "params[:id] = #{params[:id]}" # Esto mostrará el valor de params[:id] en la consola.
    @article = Article.find_by_id(params[:id])
    @commentaire = Commentaire.new
    @commentaires = @article.commentaires if @article
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
    params.require(:article).permit(:name, :banner_url, :description) # Agregar `:` antes de `description`
  end
end
