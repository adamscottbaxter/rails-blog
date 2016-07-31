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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		# understand posts_path better
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:title, :body)
		end
end
