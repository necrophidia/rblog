class PostController < ApplicationController
  def index
    if !params[:tag].nil? && !params[:tag].empty?
      puts params[:tag]
      @posts = Post.where("tag like?", "%#{params[:tag]}%")
    else
      @posts = Post.all
    end
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
    @comment_total = 0
    if !@post.comments.empty?
      @comment_total += @post.comments.size
    end
    if !@post.child_comments.empty?
      @comment_total += @post.child_comments.size
    end
  end

  def update
  end

  def like_post
  	@post = Post.find(params[:like][:likeable_id])
    @post_like = @post.likes.build(params[:like])
    if @post_like.save
      respond_to do |format|
        format.html { redirect_to :action => 'view', :id => @post.id }
        format.json { render json: @post.id, status: :created }
      end
    end
  end

  def like_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:like][:likeable_id])
    @comment_like = @comment.likes.build(params[:like])
    if @comment_like.save
      respond_to do |format|
        format.html { redirect_to :action => 'view', :id => @post.id }
        format.json { render json: @post.id, status: :created }
      end
    end
  end

  def like_like
    @like = Like.find(params[:like][:likeable_id])
    @post = Post.find(@like.likeable_id)
    @new_like = @like.likes.build(params[:like])
    if @new_like.save
      respond_to do |format|
        format.html { redirect_to :action => 'view', :id => @post.id }
        format.json { render json: @post.id, status: :created }
      end
    end
  end

  def new_comment
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment_total = 0
    if !@post.comments.empty?
      @comment_total += @post.comments.size
    end
    if !@post.child_comments.empty?
      @comment_total += @post.child_comments.size
    end
    if @comment.article_id.blank?
      @comment.article_id = @post.id
    end
    if @comment.save
      respond_to do |format|
        format.html { redirect_to :action => 'view', :id => @post.id }
        format.json { render json: @post.id, status: :created }
      end
    else
      @current_block_name = params[:current_block_name]
      @current_block_height = params[:current_block_height]
      @error = 'Please fill all fields in correct format'
      render :action => 'view'
    end
  end
end
