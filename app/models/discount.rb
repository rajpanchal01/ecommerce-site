class Discount < ApplicationRecord
    has_many :discount_items
    validates :offer_type, :inclusion => ["direct","cashback"]
    has_one_attached :slider
    def slider_url
        Rails.application.routes.url_helpers.url_for(slider)
    end
end