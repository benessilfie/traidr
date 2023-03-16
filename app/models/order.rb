class Order < ApplicationRecord
  include ActiveModel::Validations
  validates_with EnoughProductsValidator

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  before_validation :set_total!
  validates :total, presence: true

  def set_total!
    self.total = placements.map { |placement| placement.product.price * placement.quantity }.sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      product_id = product_id_and_quantity[:product_id]
      quantity = product_id_and_quantity[:quantity]

      placement = placements.build(product_id:, quantity:)

      yield placement if block_given?
    end
  end
end
