class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.to_json
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.to_json
  end

  def create
    product = Product.new(product_params)
    if product.save
      render json: product.to_json
    else
      render json: {
        error: 'Cannot Create',
        status: 500
      }, status: 500
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    if product.destroy
      render json: {id: product.id}
    end
  end


  private

  def product_params
    params.require(:product).permit(:name,:description,:img_url, :price)
  end
end
