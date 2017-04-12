class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create

    @supplier = Supplier.find(params[:supplier_id])
    @product = @supplier.products.create(product_params)
    if @product.save
      redirect_to supplier_path(@supplier)
    else
      render 'suppliers/show', id: params[:supplier_id]
    end
  end




  def destroy
      @supplier = Supplier.find(params[:supplier_id])
      @product = @supplier.products.find(params[:id])
      @product.update_attribute(:deleted_at, Time.current)
      # @product.destroy
      redirect_to supplier_path(@supplier)
  end


  private
    def product_params
      params.require(:product).permit(:ean, :description, :purchase_price, :sale_price, :vat)
    end
end
