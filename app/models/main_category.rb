class MainCategory < ApplicationRecord
    has_many :sub_categories
    has_one_attached :image
    def img_url
        self.image.service_url if image
    end
end
