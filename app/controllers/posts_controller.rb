class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,except:[:index]

  def index
    @posts = Post.all.order("created_at DESC")
    @like = Like.new
    @ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
  end

  def new
  end

  def create
    Post.create(animal: post_params[:animal], image: post_params[:image], habitat: post_params[:habitat], detail: post_params[:detail], user_id: post_params[:user_id])
    redirect_to root_path
  end

  def edit
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if @post.user_id == current_user.id
    redirect_to root_path
    # respond_to do |format|
    #   if @post.update(post_params)
    #     format.html { redirect_to @post, notice: 'Post was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @post }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    @post.destroy if @post.user_id == current_user.id
    redirect_to root_path
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:animal, :image, :habitat,:detail,:rate).merge(user_id: current_user.id)
    end
end