class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @product_collection = Product.search(params[:query])
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'Product successfully added'
    else
      render action: 'new', notice: 'Something went wrong.'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :comment, :effective, :photo, :query)
    end
end
