class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def index

    @articles = Article.all
    @articles = Article.first
    @commentaires = current_user.commentaires
  end


  def show
    @article = Article.find_by_id(params[:id])

    if @article
      @commentaire = Commentaire.new
      @commentaires = @article.commentaires
    else
      # Maneja el caso en el que no se encuentra el artículo
      flash[:error] = "El artículo no se encontró"
      redirect_to root_path # O cualquier otra ruta adecuada
    end
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
