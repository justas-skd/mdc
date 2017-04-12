class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.all
  end

  def new
    @supplier = Supplier.new
  end

  def show
    @supplier = Supplier.find(params[:id])
    @product = @supplier.products.build
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      redirect_to @supplier
    else
      render 'new'
    end
  end

  def update
    @supplier = Supplier.find(params[:id])

    if @supplier.update(supplier_params)
      redirect_to @supplier
    else
      render 'edit'
    end
  end

  # TODO: implement soft delete
  def destroy
    @supplier = Supplier.find(params[:id])
    # @supplier.destroy
    if @supplier.products.exists?
      redirect_to @supplier, :flash => { :error => "You have to delete all the products first!" }
      # errors.add("Before deleting the supplier you have to delete all its products.")
    else
      @supplier.update_attribute(:deleted_at, Time.current)
      redirect_to suppliers_path
    end

  end

  private
    def supplier_params
      params.require(:supplier).permit(:name, :address)
    end

end
