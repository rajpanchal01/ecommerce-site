class Product < ApplicationRecord
    attr_accessor :average_rating
    belongs_to :brand
    belongs_to :sub_category
    has_one :inventory, dependent: :delete
    has_many_attached :posters, dependent: :delete
    has_many :reviews, dependent: :delete_all
    belongs_to :seller
    has_one :discount_item
    include PgSearch::Model
    pg_search_scope :search_by_query, against: [:name, :description]

    def poster_urls
     #   poster_urls=[]
      #  posters.each do |p|
       #     poster_urls<<Rails.application.routes.url_helpers.url_for(p) 
        #end
        #Rails.application.routes.url_helpers.url_for(poster) if poster.attached?
        posters.map{|p| p.service_url}
    end
    def average_rating
        reviews.average(:rating)
    end
    
end
