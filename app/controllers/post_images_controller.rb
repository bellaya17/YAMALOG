class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    if user_signed_in?
      @post_images = PostImage.where(user_id: [*current_user.follower_ids]).page(params[:page]).reverse_order
      @post_images = PostImage.page(params[:page]).reverse_order
    else
      @post_images = PostImage.page(params[:page]).reverse_order
    end
  end

  def show
    if user_signed_in?
      @post_image = PostImage.find(params[:id])
      @post_comment = PostComment.new
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image.id)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def search
    if params[:keyword].present?
      @post_images = PostImage.where('text LIKE ?', "%#{params[:keyword]}%").page(params[:page]).reverse_order
      @keyword = params[:keyword]
    else
      redirect_to post_images_path
    end
  end

  private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :text)
  end

end
