class CommentController < ApplicationController
  before_action :is_writer?, only: [:delete]
  
  def create
    post = Post.find(params[:id])
    comment = post.comments.new
    comment.writer = current_user.name
    comment.user_id = current_user.id
    comment.content = params[:comment][:content]
    comment.save
    
    redirect_to :back
  end
  
  def delete
    Comment.find(params[:id]).destroy
    
    redirect_to :back
  end
  
  private
  
  def is_writer?
    comment = Comment.find(params[:id])
    if comment.user_id != current_user.id
      redirect_to '/'
    end
  end
  
end
