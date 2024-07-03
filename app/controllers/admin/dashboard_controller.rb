class Admin::DashboardController < ApplicationController
  include HttpBasicAuth

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
