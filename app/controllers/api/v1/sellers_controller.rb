module Api
    module V1
      class SellersController < ApiController
        before_action :set_seller, only: %i[ show update destroy ]
        before_action :set_user_id
        # GET /orders
        def index
          @sellers = Seller.all
          if params[:user_id]
            @sellers= @sellers.where(user_id: params[:user_id])
          end
            render json: @sellers

        end

        # GET /orders/1
        def show
          render json: @seller
        end

        # POST /orders
        def create
          @seller = Seller.new(seller_params)

          if @seller.save
            # action_item :approve, only: :index do
            #     link_to "Approve", some_path
            #   end
            #User.find(params[:user_id]).update_attribute(:status,1)
            render json: @seller, status: :created
          else
            render json: @seller.errors, status: :unprocessable_entity
          end
        end

        # PATCH/PUT /orders/1
        def update
          if @seller.update(seller_params)
            render json: @seller
          else
            render json: @seller.errors, status: :unprocessable_entity
          end
        end

        # DELETE /orders/1
        def destroy
          @seller.destroy
        end

        private
          # Use callbacks to share common setup or constraints between actions.
          def set_seller
            @seller = Seller.find(params[:id])
          end

          # Only allow a list of trusted parameters through.
          def seller_params
            params.permit(:user_id,:gst_id,:pan_id,:seller_location)
          end
          def set_user_id
            params[:user_id]=current_user.id
          end
      end
    end
  end