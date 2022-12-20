# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @liquor = Liquor.find(params[:liquor_id])
    @comment = current_user.comments.new(comment_params)
  end

  def create
    @liquor = Liquor.find(params[:liquor_id])
    @comment = current_user.comments.new(comment_params)

    return unless @comment.save

    redirect_to liquor_path(@liquor), notice: "#{@comment.title}を追加しました。"
  end

  def destroy
    @liquor = Liquor.find(params[:liquor_id])
    @comment = authorize @liquor.comments.find(params[:id])
    @comment.destroy
    redirect_to liquor_path(@liquor), status: :see_other, notice: "#{@comment.title}を削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :status, :liquor_id)
  end
end
