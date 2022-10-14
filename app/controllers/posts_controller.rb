# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1
  def show
    @user_like = @post.likes.find_by(user: current_user)
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = t('.success')
      redirect_to root_path
    else
      flash.now[:alert] = t('.error')
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:success] = t('.success')
      redirect_to @post
    else
      flash.now[:alert] = t('.error')
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    if @post.destroy
      flash[:success] = t('.success')
      redirect_to root_path
    else
      flash.now[:alert] = t('.error')
      render :show
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
