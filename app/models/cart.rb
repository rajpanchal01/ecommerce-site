class Cart < ApplicationRecord
    attr_accessor :products_details
    belongs_to :user
    has_many :cart_items , dependent: :delete_all
    def products_details
        self.cart_items.map do |a|
            a.product
        end
    end
end
