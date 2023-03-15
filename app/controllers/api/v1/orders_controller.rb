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
    order = current_user.orders.build(order_params)

    if order.save
      OrderMailer.send_confirmation(order).deliver
      render json: OrderSerializer.new(order).serialized_json, status: :created
    else
      render json: { errors: order.errors }, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:total, product_ids: [])
  end
end
