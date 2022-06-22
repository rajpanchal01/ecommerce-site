ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :name, :mobile_number,:status
  #
  # or
  #
  permit_params do
    permitted = [:status]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
  action_item :view, only: :show do
    link_to 'Approve as seller', api_v1_set_seller_path(params[:id]) 
  end
  
end
