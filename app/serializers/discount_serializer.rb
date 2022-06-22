class DiscountSerializer < ActiveModel::Serializer
  attributes :id,:name,:start_date,:end_date,:offer_type,:offer_dicount,:poster_urls
  has_many :discount_items
end