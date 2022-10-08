# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  before_action :post, only: :create
  # before_action :authenticate_user!, only: %i[create new]

  # POST /post_comments
  def create
    @comment = @post.comments.build(post_comment_params)

    @comment.creator = current_user

    if @comment.save
      flash[:success] = t('.success')
      redirect_to @post
    else
      flash[:success] = t('.error')
      render 'posts/show', status: :unprocessable_entity
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
end