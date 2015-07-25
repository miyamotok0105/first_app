class Form::IbentoCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :ibento

  def initialize(attributes = {})
    super attributes
    self.ibento = DEFAULT_ITEM_COUNT.times.map { Form::Ibento.new } unless ibento.present?
  end

  def ibento_attributes=(attributes)
    self.ibento = attributes.map do |_, product_attributes|
      Form::Product.new(product_attributes).tap { |v| v.availability = false }
    end
  end

  def valid?
    valid_products = target_products.map(&:valid?).all?
    super && valid_products
  end

  def save
    return false unless valid?
    Product.transaction { target_products.each(&:save!) }
    true
  end

  def target_products
    self.products.select { |v| value_to_boolean(v.register) }
  end
end
