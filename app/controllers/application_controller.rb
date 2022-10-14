# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def post
    @post ||= Post.find(params[:post_id])
  end
end
