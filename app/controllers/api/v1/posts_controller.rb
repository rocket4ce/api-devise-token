class Api::V1::PostsController < Api::V1::ApplicationController

	before_action :authenticate

	def index
		@posts = @current_user.posts.all
	end

	def create
		post = @current_user.posts.new(parametros)
		if post.save
			render json: post
		else
			 render json: post.errors, status: :unprocessable_entity
		end
	end

	private

	def parametros
		params.require(:post).permit(:title, :body)
	end

end
