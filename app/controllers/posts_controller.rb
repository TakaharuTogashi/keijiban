class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at => :desc).limit(10)
    @post = Post.new
    @post.name = current_post.name
    if current_post.email.present?
      @post.email = current_post.email
    end
  end

  def create
    @post = Post.new(params.require(:post).permit(:name, :email, :comment))
    if @post.save
      session[:post_id] = @post.id
      redirect_to :action => :index
    else
      @posts = Post.order(:created_at => :desc).limit(10)
      render :index
    end
  end

  def index_all
    @posts = Post.all.order(:created_at => :desc)
    render :index_all
  end

  private
  def current_post
    @_current_post ||= Post.find_by(id: session[:post_id])
  end
end
