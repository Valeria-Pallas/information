class CommentairesController < ApplicationController
  def new
    @commentaire = Commentaire.new
  end
  def create
    @article = Article.find(params[:garden_id])
    @commentaire = Commentaire.new(commentaire_params)
    @commentaire.article = @article
    if @commentaire.save
      redirect_to article_path(@article)
    else
      render "gardens/show", status: :unprocessable_entity
    end
  end

  def manage_activity
    @commentaire = Commentaire.find(params[:id])
  end

  def update
    @commentaire = Commentaire.find(params[:id])
    if @commentaire.update(commentaire_params)
      redirect_to manage_activity_commentaire_path(@commentaire), notice: 'commentaire activity updated successfully.'
    else
      render :manage_activity, status: :unprocessable_entity
    end
  end

  def destroy
    @commentaire = Commentaire.find(params[:id])
    @article = @commentaire.article
    @commentaire.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private

  def commentaire_params
    params.require(:commentaire).permit(:name, :description)
  end
end
