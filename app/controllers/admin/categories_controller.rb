class Admin::CategoriesController < ApplicationController
  include HttpBasicAuth

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Product.new(category_params)
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
