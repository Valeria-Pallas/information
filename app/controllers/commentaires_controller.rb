class CommentairesController < ApplicationController
  def new
    @article = Article.find(params[:article_id])
    @commentaire = Commentaire.new
  end

  def create
    @article = Article.find(params[:article_id])
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.article = @article
    if @commentaire.save
      redirect_to article_path(@article), notice: 'Comentario creado exitosamente.'
    else
      render 'articles/show', status: :unprocessable_entity
    end
  end

  def edit
    @commentaire = Commentaire.find(params[:id])
  end

  def update
    @commentaire = Commentaire.find(params[:id])
    if @commentaire.update(commentaire_params)
      redirect_to article_path(@commentaire.article), notice: 'Comentario actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @commentaire = Commentaire.find(params[:id])
    @article = @commentaire.article
    if @commentaire.destroy
      redirect_to article_path(@article), notice: 'Comentario eliminado exitosamente.'
    else
      redirect_to article_path(@article), alert: 'No se pudo eliminar el comentario.'
    end
  end

  # ...

  private

  def commentaire_params
    params.require(:commentaire).permit(:name, :description)
  end
end
