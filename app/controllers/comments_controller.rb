class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:notice] = 'コメントを投稿しました'
      # belong_toで紐づいてるから、list[:id]にリダイレクトできる
      redirect_to comment.list
    else
      redirect_to :back, flash: {
        comment: comment,
        error_messages: comment.errors.full_messages
      }
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.list, flash: { noitice: 'コメントを削除しました' }
  end

  private
  
  def comment_params
    params.require(:comment).permit(:list_id, :name, :comment)
  end
end
