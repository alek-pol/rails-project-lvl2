# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :post, only: :create

  # POST /post_comments
  def create
    @comment = @post.comments.build(post_comment_params)

    @comment.user = current_user

    if @comment.save
      flash[:success] = t('.success')
      redirect_to @post
    else
      flash[:alert] = t('.error')
      redirect_to post_path(@post)
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
