class Order < ApplicationRecord
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  before_validation :set_total!
  validates :total, presence: true

  def set_total!
    self.total = products.map(&:price).sum
  end
end
