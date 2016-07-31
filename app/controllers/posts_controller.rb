class PostsController < ApplicationController
	def index
		@posts = Post.all.order('created_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		p "--- create method---"
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			p "----fail save ----"
			render 'new' # by rendering instead of redirected the content will stay on the page in case they need to reenter the info
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
