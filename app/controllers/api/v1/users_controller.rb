module Api
    module V1

        class UsersController < ApiController
            before_action :set_user_id only: %i[ verify ]
            def index
                @users = User.all
                render json: {data: @users},status: :ok
            end
            def create

                @user_data1 =User.find_by(email: user_params[:email])
                @user_data2 =User.find_by(mobile_number: user_params[:mobile_number])
                if (!@user_data1) && (!@user_data2) 
                    @user= User.create(user_params)
                    # if Cart.find_by(user_id: @user.id)

                    # else
                    Cart.create(user_id: @user.id) if !Cart.find_by(user_id: @user.id)
                
                    Wishlist.create(user_id: @user.id) if !Wishlist.find_by(user_id: @user.id)
                    @otp=rand.to_s[2..7]
                    UserOtp.create!(otp: @otp,user_id: @user.id)
                    UserMailer.with(mail: @user).new_user_otp_email.deliver_later
                    if @user.valid?
                        token = encode_token({user_id: @user.id})
                        render json:  {user: @user,token: token}, status: :ok
                    else 
                        render json: {error: "Invalid username or password"}, status: :unprocessable_entity

                    end
                else
                   render json: {error: "Email or mobile number already exist!"}, status: :unprocessable_entity
                 end
            end
            def login
                @user =User.find_by(email: user_params[:email])
                
                if @user && @user.authenticate(user_params[:password])
                    token = encode_token({user_id: @user.id})
                    render json:  {user: @user,token: token}, status: :ok
                else
                    render json: {error: "Invalid username or password"}, status: :unprocessable_entity
                end
            end
            def verify
                if !isverified
                    if UserOtp.find_by(otp: params[:otp])
                        if current_user.id ==UserOtp.find_by(otp: params[:otp]).user_id
                            current_user.update_attribute(:is_varified,1)
                            UserOtp.find_by(user_id: current_user.id).destroy
                            render json: { masssage: "is_varified"}
                        end
                    end
                end
            end
            def set_seller
                #User.find(params[:format]).update(status: 1)
                Seller.find_by(user_id: User.find(params[:format]).id).update_attribute(:status,1)
            end
            def logout

            end
            private
            def user_params
                params.permit(:email,:password,:name,:mobile_number)
            end
            def set_user_id
                params[:user_id]=current_user.id
            end
        end
    end

end