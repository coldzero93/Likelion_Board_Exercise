class PostController < ApplicationController
  before_action :authenticate_user!, only: [:write]
  before_action :is_writer?, only: [:edit, :update, :delete]
  
  def write
  end
  
  def create
    user = User.find(current_user.id)
    post = user.posts.new
    post.writer = user.name
    post.title = params[:post][:title]
    post.content = params[:post][:content]
    post.save
    
    redirect_to '/'
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    
    @previous = Post.previous(@post.id)
    @previous = @previous.nil? ? nil : @previous.id;
    @next = Post.next(@post.id)
    @next = @next.nil? ? nil : @next.id;
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    post.title = params[:post][:title]
    post.content = params[:post][:content]
    post.save
    
    redirect_to "/post/#{params[:id]}"
  end
  
  def delete
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
  
  private
  
  def is_writer?
    post = Post.find(params[:id])
    if post.user.id != current_user.id
      redirect_to '/'
    end
  end
  
end
