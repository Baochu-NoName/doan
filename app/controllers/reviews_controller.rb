class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_product
  before_action :authenticate_user!
  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    if @review.save
      flash[:notice] = "Review was sucessfully created "
      redirect_to @product
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      flash[:notice] = "Review was sucessfully updated"
      redirect_to @product
    else
      render :edit
    end
  end
  
  def destroy
    @review.destroy
    flash[:notice] = "Review was sucessfully deleted"
    redirect_to products_url
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end
  def set_product
    @product = Product.find(params[:product_id])
  end
  def review_params
    params.require(:review).permit(:product_id, :user_id,:user_email, :rating, :comment)
  end
end
