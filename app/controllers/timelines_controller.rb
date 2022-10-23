class TimelinesController < ApplicationController
  def index
    @posts = Post.not_reply.where(user_id: [current_user.id, *current_user.followings.pluck(:id)])
      .includes(postable: [:place]).order("created_at desc")
  end

  def show
    @visited_user = User.find_by_username!(params[:username])
    @posts = Post.written_by(params[:username]).not_reply.order("created_at DESC")
  end
end
