# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @liquor = Liquor.find(params[:liquor_id])
    @comment = @liquor.comments.create(comment_params)
    redirect_to liquor_path(@liquor)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
