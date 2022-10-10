# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :post, only: %i[create destroy]

  def create
    @like = @post.likes.build

    @like.user = current_user

    redirect_to @post if @like.save
  end

  def destroy
    @like = @post.likes.find(params[:id])

    redirect_to @like.post if @like.destroy
  end
end
