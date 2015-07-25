class Form::Product2Collection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :products2

  def initialize(attributes = {})
    super attributes
    self.products2 = DEFAULT_ITEM_COUNT.times.map { Form::Product.new } unless products2.present?
  end

  def products_attributes=(attributes)
    self.products2 = attributes.map do |_, product_attributes|
      Form::Product2.new(product_attributes).tap { |v| v.availability = false }
    end
  end

  def valid?
    valid_products = target_products.map(&:valid?).all?
    super && valid_products
  end

  def save
    return false unless valid?
    Product2.transaction { target_products.each(&:save!) }
    true
  end

  def target_products
    self.products2.select { |v| value_to_boolean(v.register) }
  end
end
