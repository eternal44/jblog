class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @q = Post.published.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    authorize @post
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    save_post or render 'new'
  end

  def edit
    authorize @post
  end

  def update
    # @post ||= post_scope.build
    # @post.attributes = post_params
    # authorize @post
    # save_post or render 'edit'

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.'}
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  private

  def save_post
    if @post.save
      redirect_to @post
    end
  end

  def post_params
    params.require(:post).permit(:title, :text, :published_at, :status)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_scope
    Post.all #fill in
  end
end
# class PostsController < ApplicationController
#   before_action :set_post, only: [:show, :edit, :update, :destroy]
#   def index
#     @q = Post.published.ransack(params[:q])
#     @posts = @q.result(distinct: true)
#   end

#   def show
#     authorize @post
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.new(post_params)

#     respond_to do |format|
#       if @post.save
#         format.html { redirect_to @post, notice: 'Post was successfully created.'}
#         format.json { render :show, status: :created, location: @post }
#       else
#         format.html { render :new }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def edit
#   end

#   def update
#     respond_to do |format|
#       @post.update_attribute(:photo, params[:post][:photo])
#       if @post.save
#         format.html { redirect_to @post, notice: 'Post was successfully updated.'}
#         format.json { render :show, status: :created, location: @post }
#       else
#         format.html { render :new }
#         format.json { render json: @post.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   def destroy
#     @post.destroy
#     respond_to do |format|
#       format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#   def set_post
#     @post = Post.find(params[:id])
#   end

#   def post_params
#     params.require(:post).permit(:title, :text, :published_at, :status, :photo)
#   end
# end
