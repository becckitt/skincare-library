module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :update, :destroy]

      def index
        @products = Product.all.where(wishlist: false)

        render json: ProductSerializer.new(@products).serialized_json
      end

      def wishlist
        @products = Product.all.where(wishlist: true)

        render json: ProductSerializer.new(@products).serialized_json
      end

      def show
        render json: @product
      end

      def create
        @product = Product.new(product_params)

        if @product.save
          render json: @product, status: :created, location: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def update
        if @product.update(product_params)
          render json: @product
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @product.destroy
      end

      private
        def set_product
          @product = Product.find(params[:id])
        end

        def product_params
          params.require(:product).permit(:id, :name, :comment, :rating, :price, :link, :repurchase)
        end
    end
  end
end
