class HatesController < ApplicationController
    def index
      #@users = User.all
      #@hates = Hate.all
      #@rating = Rating.new
    end

    def new
        @hate = Hate.new
    end

    def create
        @hate = current_user.hates.create(params[:hate])
        redirect_to(root_path)
    end

    def edit
        @hate = current_user.hate.find(params[:id])
    end

    def update
        hate = User.find(params[:id])
        hate.update_attributes(params[:hate])
        redirect_to(hate)
    end

    def destroy
        hate = Hate.find(params[:id])
        hate.destroy
        redirect_to(hates_path)
    end

end