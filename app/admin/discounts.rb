ActiveAdmin.register Discount do
    
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    # permit_params :name
    #
    # or
    permit_params :name ,:start_date,:end_date,:offer_type,:offer_dicount,:poster
    form html: { multipart: true } do |f|
        f.inputs "Discount" do
          f.input :name
          f.input :start_date
          f.input :end_date
          f.input :offer_type
          f.input :offer_dicount

          f.input :poster, as: :file
        end
    
        f.actions
      end
    # permit_params do
    #   permitted = [:name]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end
    
  end
  