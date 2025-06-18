class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit, :update, :destroy]

  def index
    if params[:tag]
      @tag_name = params[:tag]
      @posts = Post.tagged_with(@tag_name).order(created_at: :desc)
    else 
      @posts = Post.all.order(created_at: :desc)
    end
  end
  
  def show 
    set_meta_tags title: @post.meta_title,
      description: @post.meta_description,
      og:{
        title: @post.meta_title,
        description: @post.meta_description,
        type: "article",
        url: post_url(@post),
        image: url_for(@post.featured_image.variant(:medium))
      }

  end
  def new 
    @post= Post.new
  end

  def edit
  end

  def create
    @post= Post.new(post_params)
    if @post.save 
      redirect_to @post, notice: "post was successfully created  !!  "
    else
      render :new, status: :unproccessable_entity
    end
  end
  def update 
    if @post.update(post_params)
      redirect_to @post, notice: 'post was successfully updated !! '
    else 
      render :edit, status: :unproccessable_entity
    end
  end
  

  def destroy 
    @post.destroy 
    redirect_to posts_url, notice: 'post was successfuly Destroyed ! '
  end
  
  private 
   
  def set_post 
    @post = Post.friendly.find(params[:id])
  end

  def post_params 
    params.require(:post).permit(
      :title,
      :content,
      :meta_title,
      :meta_description,
      :image_alt,
      :featured_image
    )
  end
end
