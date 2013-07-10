class HatesController < ApplicationController
    def index
      @hates = Hate.all
    end

    def new
    @hate = current_user.hates.new
    end

    def create
    @hate = current_user.hates.create(params[:hate])
    redirect_to(hate)
    end

    def show
        @hate = Hate.find(params[:id])

    end

    def edit
        @hate = Hate.find(params[:id])
    end

    def update
        hate = User.find(params[:id])
        hate.update_attributes(params[:hate])
        redirect_to(hate)
    end

    def destroy
        if current_user == hateauthor
            then destroy
        else
            they can't do it.
        #select the current users hate you are referring too here
        #destoy it from their hates ie:
        current_use



        hate = Hate.find(params[:id])
        hate.destroy
        redirect_to(hates_path)
    end

end