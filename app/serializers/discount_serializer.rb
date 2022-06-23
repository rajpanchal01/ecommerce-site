class DiscountSerializer < ActiveModel::Serializer
  attributes :id,:name,:start_date,:end_date,:offer_type,:offer_dicount,:poster_url,:discount_items
  # def discount_items
  #   object.discount_items.map do |project|
  #     ::DiscountItemSerializer.new(project).attributes
  #   end
  # end
  def discount_items
    customized_estimates = []
    object.discount_items.each do |estimate|
     
      custom_estimate = estimate.attributes

      custom_estimate[:product] = estimate.product
    
      customized_estimates.push(custom_estimate)
    end

    return customized_estimates
  end
 end