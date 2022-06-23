class Discount < ApplicationRecord
    has_many :discount_items
    validates :offer_type, :inclusion => ["direct","cashback"]
    has_one_attached :poster
    # def slider_url
    #     Rails.application.routes.url_helpers.url_for(slider)
    # end
    def poster_url
        #   poster_urls=[]
         #  posters.each do |p|
          #     poster_urls<<Rails.application.routes.url_helpers.url_for(p) 
           #end
           #Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
        self.poster.service_url
    end
end