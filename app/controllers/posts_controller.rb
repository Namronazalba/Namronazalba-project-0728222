class PostsController < ApplicationController
  before_action :authenticate_user!, except: :home
  before_action :set_post, only: :show
  before_action :set_own_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:user)
    @domain = request.base_url
    @posts = Post.all.includes(:user, :category).left_joins(:comments).group(:id).order("count(comments.id) desc")
  end

  def home
    @posts = Post.includes(:user)
    @posts = Post.all.includes(:user, :category).page(params[:page]).per(4)
  end

  def new
    @post = Post.new
  end

  def redirect
    @maigsing_url = params[:url_short]
    @post = Post.find_by(url_short: @maigsing_url)
    redirect_to post_path(@post)
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @post.comments.size == 0
      @post.destroy
      redirect_to posts_path
    end
  end

  private

  def set_own_post
    @post = current_user.posts.find_by_id(params[:id])
    if @post.nil?
      flash[:alert] = 'this post not belongs to you or not exists'
      redirect_to posts_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :content, :address, :category_id, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
