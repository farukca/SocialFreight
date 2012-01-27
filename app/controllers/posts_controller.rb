class PostsController < ApplicationController

  before_filter :require_login
  respond_to :js, :json

  def create
    @post = Post.new(params[:post])
    @post.user_id  = current_user.id
    @post.patron_id  = current_patron.id
    @post.patron_token  = current_patron.token

    @post.save!
    respond_with @post, :success => "post added"
  end

  def destroy
    @post = post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end

end
