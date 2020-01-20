class PostsController < ApplicationController
	before_action :authenticate_user!,except: %i[ index]
	before_action :find_post,except: %i[new index create]

	def index
		@posts = Post.all
	end

	def new
		@post = current_user.posts.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			flash[:success] = "Post Created Successfully"
			redirect_to posts_path
		else
			flash[:error] = @post.errors.full_messages.join(', ')
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post Updated Successfully"
		else
			flash[:error] = @post.errors.full_messages.join(', ')
		end
		redirect_to edit_post_path(@post)
	end

	def destroy
	end

	private
		def post_params
			params.require(:post).permit(:title,:description,:image)
		end 
end
