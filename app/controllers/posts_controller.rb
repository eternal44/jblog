class PostsController < ApplicationController
def index
    load_posts
  end

  def show
    load_post
  end

  def new
    build_post
  end

  def create
    build_post
    save_post or render 'new'
  end

  def edit
    load_post
    build_post
  end

  def update
    load_post
    build_post
    save_post or render 'edit'
  end

  def destroy
    load_post
    @post.destroy
    redirect_to posts_path
  end

  private

  def load_posts
    @q = Post.published.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def load_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def build_post
    @post ||= post_scope.build
    @post.attributes = post_params
    authorize @post
  end

  def save_post
    if @post.save
      redirect_to @post
    end
  end

  def post_params
    post_params = params[:post]
    post_params ? post_params.permit(:title, :text, :published_at, :status) : {}
  end

  def post_scope
    Post.all #fill in
  end

end
