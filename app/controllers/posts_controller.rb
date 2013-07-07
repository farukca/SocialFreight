class PostsController < ApplicationController

  include Twitter::Extractor
  before_filter :require_login
  before_filter(:only => [:index]) { |c| c.set_tab "postnavigator" }
  respond_to :js, :json, :html

  def show
    @post = Post.find(params[:id])
  end

  def create
    @target = find_target
    if @target
      @post = @target.posts.build(params[:post])
      @post.target_name = @target.to_s[0, 40]
    else
      @post = Post.new(params[:post])
    end
    @post.user_id  = current_user.id
#TODO daha sonra bakmak üzere şimdilik kapatalım mention olayını
    #usernames = extract_mentioned_screen_names(params[:post][:message]) if params[:post][:message]
    #usernames.each do |username|
    #  @object = Nick.find_by_name(username)
    #  @post.mention!(@object.nicknamed) unless @object.nil?
    #end if usernames
    @post.save!
    respond_with @post, success: "Successfully saved post"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_with @post, notice: "Successfully destroyed post"
  end

  private
  def find_target
    if params[:ticket_id]
      return Helpdesk::Ticket.find(params[:ticket_id])
    else
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end
    nil
  end

end
