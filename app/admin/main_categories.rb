ActiveAdmin.register MainCategory do
  permit_params :name,:about,:image

  form html: { multipart: true } do |f|
    f.inputs "Category" do
      f.input :name
      f.input :about
      #f.input :published
      f.input :image, as: :file
    end

    f.actions
  end

  # show do
  #   attributes_table do
  #     row :image do
  #       div do
  #         post.images  image_tag url_for(img), size: "200x200"
  #           end
  #         end
  #       end
  #     end

  #     row :name
  #     row :about
  #   end
  # end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :about
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :about]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
