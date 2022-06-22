ActiveAdmin.register Seller do
    #permit_params :name
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
     permit_params :user_id, :seller_location,:gst_id,:pan_id
    #
    # or
    #
    # permit_params do
    #   permitted = [:name, :main_category_id]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
  end