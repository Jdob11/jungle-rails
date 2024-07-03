class Admin::ProductsController < ApplicationController
  before_action :authenticate

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

  def authenticate
    username = ENV['HTTP_BASIC_AUTH_USERNAME']
    password = ENV['HTTP_BASIC_AUTH_PASSWORD']

    authenticate_or_request_with_http_basic do |provided_username, provided_password|
      provided_username == username && provided_password == password
    end
  end

end
