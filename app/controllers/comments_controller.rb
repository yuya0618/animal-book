class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:post_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id]), notice: 'コメントを完了しました' }
      format.json
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to post_path(params[:post_id]), notice: 'コメントを削除しました'
  end

  private
  def comment_params
    params.permit(:text, :post_id)
  end
end

