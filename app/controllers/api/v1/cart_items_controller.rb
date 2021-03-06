module Api
    module V1
        class CartItemsController < ApiController
    before_action :set_cart_item, only: %i[ show update destroy ]
    before_action :set_cart_id
    before_action :set_item_quantity
    # GET /cart_items
    def index
        if params[:cart_id]
            @cart_items=CartItem.where(cart_id: params[:cart_id])
        else
            @cart_items = CartItem.all
        end
  
      render json: @cart_items
    end
  
    # GET /cart_items/1
    def show
      render json: @cart_item
    end
  
    # POST /cart_items
    def create
        @cart_item=CartItem.where(cart_id: params[:cart_id],product_id: params[:product_id])
        if @cart_item!=[]
          
          @cart_item[0].increment!(:item_quantity, 1)
        
          render json: @cart_item , status: :ok
        else
            @cart_item = CartItem.new(cart_item_params)

          if @cart_item.save
            render json: @cart_item, status: :created
          else
            render json: @cart_item.errors, status: :unprocessable_entity
          end
        end
    end
  
    # PATCH/PUT /cart_items/1
    def update
      if @cart_item.update(cart_item_params)
        render json: @cart_item
      else
        render json: @cart_item.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /cart_items/1
    def destroy
      @cart_item.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cart_item
        @cart_item = CartItem.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def cart_item_params
        params.permit(:item_quantity,:cart_id,:product_id)
      end
      def set_cart_id
        params[:cart_id]=Cart.find_by(user_id: current_user.id).id
      end
      def set_item_quantity
        params[:item_quantity]=1
      end
  end
end
end