class ApiController < ApplicationController

	def index
		@posts = Post.all
		render :json => @posts
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@child_comments = @post.child_comments
    	@comment_total = 0
	    if !@post.comments.empty?
	      @comment_total += @post.comments.size
	    end
	    if !@post.child_comments.empty?
	      @comment_total += @post.child_comments.size
	    end
		render :json => {:post => @post.comments_hash}
	end

	def create
		render :json => Post.create(params[:post])
	end


end
