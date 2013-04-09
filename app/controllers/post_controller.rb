class PostController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	if !params[:post].nil? && !params[:post].empty?
  		@post = Post.new(params[:post])
  		if @post.save
  			redirect_to :action => 'view', :id => @post.id
  		end
  	else
  		@post = Post.new
  	end
  end

  def view
  	@post = Post.find(params[:id])
  end

  def update
  end

  def like_post
  	@post = Post.find(params[:like][:likeable_id])
    @post_like = @post.likes.build(params[:like])
    if @post_like.save
      redirect_to :action => 'view', :id => @post.id
    end
  end

  def like_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:like][:likeable_id])
    @comment_like = @comment.likes.build(params[:like])
    if @comment_like.save
      redirect_to :action => 'view', :id => @post.id
    end
  end

  def new_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    if @comment.article_id.blank?
      @comment.article_id = @post.id
    end
    if @comment.save
      redirect_to :action => 'view', :id => @post.id
    else
      @current_block_name = params[:current_block_name]
      @current_block_height = params[:current_block_height]
      @error = 'Please fill all fields'
      render :action => 'view'
    end
  end
end
