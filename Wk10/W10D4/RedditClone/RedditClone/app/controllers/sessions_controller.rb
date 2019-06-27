class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        # debugger
        if user 
            login(user)
            redirect_to subs_url
        else 
        flash.now[:errors] = ["invalid username/password combo"]
        render :new
        end
    end 

    def destroy
        logout
        redirect_to new_session_url
    end 
end
