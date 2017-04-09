class ProductsController < ApplicationController

  def create
    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products.create(product_params)
    redirect_to supplier_path(@supplier)
  end

  def destroy
      @supplier = Supplier.find(params[:supplier_id])
      @product = @supplier.products.find(params[:id])
      @product.destroy
      redirect_to supplier_path(@supplier)
  end


  private
    def product_params
      params.require(:product).permit(:ean, :description)
    end
end
