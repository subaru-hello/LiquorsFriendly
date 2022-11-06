# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @liquor = Liquor.find(params[:liquor_id])
    @comment = @liquor.comments.create(comment_params)
    redirect_to liquor_path(@liquor)
  end

  def destroy
    @liquor = Liquor.find(params[:liquor_id])
    @comment = @liquor.comments.find(params[:id])
    @comment.destroy
    redirect_to liquor_path(@liquor), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
