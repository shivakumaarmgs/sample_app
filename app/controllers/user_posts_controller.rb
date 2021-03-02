class UserPostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.select { |x| x.user.email == current_user.email }
  end
end
