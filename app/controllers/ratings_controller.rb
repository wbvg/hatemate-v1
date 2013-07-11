class RatingsController < ApplicationController
    def new
      @rating = Rating.new
    end

    def create
      @hate = Hate.find(params[:rating][:hate_id])
      @hate.ratings.new(:hate_up => params[:rating][:hate_up], :hate_down => params[:rating][:hate_down], :user_id => current_user.id)
      @hate.save
      redirect_to(root_path)
    end

end
