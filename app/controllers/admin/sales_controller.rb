class Admin::SalesController < ApplicationController
  include SalesHelper

  def index
    @sales = Sale.all
    if active_sale?
      @active_sale = Sale.active.first
    end
  end

  def destroy
    @sale = Sale.find params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], notice: 'Sale deleted!'
  end

end
