class Api::V1::PostsController < ApplicationController
  def create
    params.require(:post)[:user_id] = session[:user_id]
    post = Post.new(post_params)
    if post.save
      render json:{ status: '200', result: { id:post.id, name:post.name, image:post.image, price:post.price, purchase_date:post.purchase_date } }
    else
      render json: { result: { message: '見つかりません', description: 'システム管理者にお問い合わせください' } }
    end
  end
  
  private

  def set_post
    @user = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :price, :purchase_date, :image, :user_id)
  end
  wrap_parameters :post, include: [:name, :price, :purchase_date, :image, :user_id]
end