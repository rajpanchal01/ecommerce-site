class Discount < ApplicationRecord
    has_many :discount_items
    validates :offer_type, :inclusion => ["direct","cashback"]
    has_many_attached :posters
    def slider_url
        Rails.application.routes.url_helpers.url_for(image) if object.attached? :image
    end
    def poster_urls
        #   poster_urls=[]
         #  posters.each do |p|
          #     poster_urls<<Rails.application.routes.url_helpers.url_for(p) 
           #end
           #Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
        posters.map{|p| Rails.application.routes.url_helpers.url_for(p) }
    end
end