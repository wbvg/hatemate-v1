class UsersController < ApplicationController
    def index
      @users = User.all
      @rating = Rating.new
     end

    def new
        @user = User.new
    end

   def create
        user = User.create(params[:user])
        redirect_to(user)
    end

def show
        @rating = Rating.new
        @user = User.find(params[:id])
        # @user = current_user.hate.find(params[:id])
        # redirect_to(current_user_path(params[:id]))
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update_attributes(params[:user])
        redirect_to(user)
    end


end
