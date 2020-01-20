class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post

	def new
		@comment = @post.comments.new
		@post_comments = @post.comments.where.not(id: nil)
	end

	def create
		@comment = @post.comments.new(comment_params)
		if @comment.save
			flash[:success] = 'Your comment was successfully posted!'
      redirect_to request.referer
    else
    	flash[:error] = @comment.errors.full_messages.join(', ')
      redirect_to request.referer
    end
	end

	private
  
	  def find_post
	    @post = Post.find(params[:post_id])
	  end

	  def comment_params
	  	params.require(:comment).permit(:body).merge(user_id: current_user.id)
	  end
end
