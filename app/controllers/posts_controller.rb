class PostsController < ApplicationController

  include Twitter::Extractor
  before_filter :require_login
  respond_to :js, :json

  def create
    @post = Post.new(params[:post])
    @post.user_id  = current_user.id

    usernames = extract_mentioned_screen_names(params[:post][:message]) if params[:post][:message]
    usernames.each do |username|
      @object = Nick.find_by_name(username)
      @post.mention!(@object.nicknamed) unless @object.nil?
    end if usernames

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
