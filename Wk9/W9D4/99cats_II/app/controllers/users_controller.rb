class UsersController < ApplicationController
    
    def new 
        @user = User.new
        render :new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
    
    def show
        @user = find_by(params[:user_name])
        render :show
    end
     
    private

    def user_params
        params.require(:user).permit(:user_name, :password, :token)
    end

end