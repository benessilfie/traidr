class EnoughProductsValidator < ActiveModel::Validator
  def validate(record)
    record.placements.each do |placement|
      quantity = placement.quantity

      if placement.product.quantity <= 0
        record.errors.add(:base, "#{placement.product.title} is out of stock")
      elsif placement.product.quantity < quantity
        record.errors.add(:base, "#{placement.product.title} is out of stock, only #{placement.product.quantity} left")
      end
    end
  end
end
