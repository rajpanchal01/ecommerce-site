class CartSerializer < ActiveModel::Serializer
  # attributes :id,:user_id,:created_at,:updated_at,:products_details
  # has_many :cart_items
  attributes :id,:user_id,:created_at,:updated_at,:cart_items
  def cart_items
    customized_estimates = []
    object.cart_items.each do |estimate|
      
      custom_estimate = estimate.attributes
      custom_estimate[:product] = estimate.product 
      customized_estimates.push(custom_estimate)
    end

    return customized_estimates
  end

end
