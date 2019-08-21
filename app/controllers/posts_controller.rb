class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,except:[:index]

  def index
    @posts = Post.all.order("created_at DESC").limit(5)
    @like = Like.new
    @ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def show
    @like = Like.where(user_id: current_user.id, post_id: params[:post_id])
    @comments = @post.comments
  end

  def new
  end

  def create
    if post_params[:image]
        if Post.create(animal: post_params[:animal], image: post_params[:image], habitat: post_params[:habitat], detail: post_params[:detail], user_id: post_params[:user_id])
          respond_to do |format|
            format.js {render ajax_redirect_to(root_path)}
          end
        end
    else
      flash.now[:alert] = "画像は必須項目です"
      render :new
    end
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

  def list
    @posts = Post.page(params[:page]).per(10).order("created_at DESC")
  end


  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.permit(:animal, :image, :habitat,:detail).merge(user_id: current_user.id)
    end

    def ajax_redirect_to(redirect_uri)
      { js: "window.location.replace('#{redirect_uri}');" }
    end
end