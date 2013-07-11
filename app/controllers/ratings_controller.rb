class RatingsController < ApplicationController
    def new
    @rating = Rating.new
     end

     def create
      #raise 'sdfsd'
      #@hate = Hate.find(get some id passed in from the form)

      @hate = Hate.find(params[:rating][:hate_id])
      @hate.ratings.new(:hate_up => params[:rating][:hate_up], :hate_down => params[:rating][:hate_down], :user_id => current_user.id)
      @hate.save

      #@rating = hates.rating.create(params[:rating])
      redirect_to(root_path)
    end

          # @rating = current_user.hates.create(params[:rating])
      # @rating = current_user.hate.ratings.create(params[:rating])

end

 # if
 #      @rating = @rating.hate_up
 #      @rating = hate.ratings.create(params[:rating])

 #     redirect_to(root_path)