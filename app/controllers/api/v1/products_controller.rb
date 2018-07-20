class Api::V1::ProductsController < ApiController
  # before_action :apply_strong_params, only: [:create, :update]

  def index
    products = Product.all
    render_jsonapi(products)
  end

  def show
    scope = jsonapi_scope(Product.where(id: params[:id]))
    render_jsonapi(scope.resolve.first, scope: false)
  end

  def create
    product, success = jsonapi_create.to_a

    if success
      render_jsonapi(product, scope: false)
    else
      render_errors_for(product)
    end
  end

  def update
    product, success = jsonapi_update.to_a

    if success
      render_jsonapi(product, scope: false)
    else
      render_errors_for(product)
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    return head(:no_content)
  end
end
