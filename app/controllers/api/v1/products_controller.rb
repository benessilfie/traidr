class API::V1::ProductsController < ApplicationController
  include Paginable
  before_action :set_product, only: %i[show update destroy]
  before_action :check_login, only: %i[create]
  before_action :check_owner, only: %i[update destroy]

  def index
    @products = Product.page(current_page).per(per_page).search(params)
    options = get_links_serializer_options('api_v1_products_path', @products)
    render json: ProductSerializer.new(@products, options).serialized_json, status: :ok
  end

  def show
    options = { include: %i[user] }
    render json: ProductSerializer.new(@product, options).serialized_json, status: :ok
  end

  def create
    product = current_user.products.build(product_params)

    if product.save
      render json: ProductSerializer.new(product).serialized_json, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: ProductSerializer.new(@product).serialized_json, status: :ok
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def check_owner
    head :forbidden unless @product.user_id == current_user&.id
  end

  def product_params
    params.require(:product).permit(:title, :price, :published)
  end
end
