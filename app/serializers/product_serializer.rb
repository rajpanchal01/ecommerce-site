class ProductSerializer < ActiveModel::Serializer
  attributes :id ,:description,:price,:created_at,:updated_at,:sub_category_id,:brand_id,:poster_urls
end
