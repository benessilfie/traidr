class API::V1::OrdersController < ApplicationController
  before_action :check_login, only: %i[index show create]

  def index
    render json: OrderSerializer.new(current_user.orders).serialized_json, status: :ok
  end

  def show
    order = current_user.orders.find(params[:id])

    if order
      options = { include: %i[products] }
      render json: OrderSerializer.new(order, options).serialized_json, status: :ok
    else
      head :not_found
    end
  end

  def create
    order = Order.create! user: current_user
    order.build_placements_with_product_ids_and_quantities(order_params[:product_ids_and_quantities])

    if order.save
      OrderMailer.send_confirmation(order).deliver
      render json: OrderSerializer.new(order).serialized_json, status: :created
    else
      render json: { errors: order.errors }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(product_ids_and_quantities: %i[product_id quantity])
  end
end
