class HomeController < ApplicationController
  
  def index
    s_type = params[:s_type]
    search = params[:search]
    if s_type == nil || search == nil
      @posts = Post.order("created_at DESC").page params[:page]
    else
      if s_type == "s_title"
        @posts = Post.where("title like '%#{search}%'").order("created_at DESC").page params[:page]
      elsif s_type == "s_content"
        @posts = Post.where("content like '%#{search}%'").order("created_at DESC").page params[:page]
      elsif s_type == "s_writer"
        @posts = Post.where("writer like '%#{search}%'").order("created_at DESC").page params[:page]
      else
        @posts = Post.order("created_at DESC").page params[:page]
      end
    end
  end
  
end
