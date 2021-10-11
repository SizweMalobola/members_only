class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            helpers.login(user)
            redirect_to posts_path
        else
            flash.now[:danger] = 'Invalid email/password combination'
            render :new
        end
    end

    def destroy
        helpers.logout if helpers.logged_in?
        redirect_to root_path
    end
end
