class HatesController < ApplicationController
    def index
      @hates = Hate.all
     end

    def new
        @hate = Hate.new
    end

    def create
        hate = Hate.create(params[:hate])



#     def
#         when @hate_rate1 = Hate.find(params[:hate_rate])
#         end

#         @hate_rate1 = Hate.find(params[:hate_rate])
#         @hate_rate2 = Hate.find(params[:hate_rate])
#         @hate_rate3 = Hate.find(params[:hate_rate])
#         @hate_rate4 = Hate.find(params[:hate_rate])
#         @hate_rate5 = Hate.find(params[:hate_rate])


# ['Slight Hate'],['Hate'],['Really Hate'],['Super Hate'],['Extremly Hate'] ]) %>
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
        hate = Hate.find(params[:id])
        hate.destroy
        redirect_to(hates_path)
    end







   end