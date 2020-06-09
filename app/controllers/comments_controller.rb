class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  # before_action :set_comment, only: [:show]
  # before_action :set_recipe, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  # before_action :set_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @comments = recipe.comments
  end

  def create
    # conditions: new comment or reply to previous comment
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to current_page_url, notice: 'comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_user
    @user = current_user

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
