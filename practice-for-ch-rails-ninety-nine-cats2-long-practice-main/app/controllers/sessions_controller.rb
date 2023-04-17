class SessionsController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user= User.find_by_credentials(params[:user][:username], params[:user][:password])
        if !@user.nil?
            @user.reset_session_token!
            redirect_to cats_url
        else
            @user = User.new
            render :new #maybe
        end
    end

    def destroy
        if !current_user.nil?
            current_user.reset_session_token!
            session_token = nil
        else
            redirect_to cats_url
        end
    end
end