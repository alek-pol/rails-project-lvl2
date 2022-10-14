# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :post, only: %i[create destroy]

  def create
    @like = @post.likes.build(user: current_user)
    @like.save

    redirect_to @post # post_path(@post)
  end

  def destroy
    @like = PostLike.find_by(id: params[:id])
    @like&.destroy

    redirect_to @post
  end
end
