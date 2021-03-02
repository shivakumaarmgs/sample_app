class PostsController < ApplicationController
  before_action :set_post, except: [:new, :create, :index, :posts_of_category]

  def index
    @posts = Post.all.select { |x| x.post_status == "published" }
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      flash[:alert] = "#{@post.errors.full_messages.join("/n")}"
      redirect_to new_post_path(@post)
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :post_status)
  end
end
