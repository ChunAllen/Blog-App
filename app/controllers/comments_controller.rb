class CommentsController < ApplicationController

  before_action :set_post

  def index
    @comments = @post.comments.all
  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.new permitted_params
    if @comment.save
      redirect_to post_comments_path(@post.id)
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find params[:post_id]
  end

  def permitted_params
    params.require(:comment).permit(:body)
  end

end
