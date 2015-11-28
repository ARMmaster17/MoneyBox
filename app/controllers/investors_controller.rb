class InvestorsController < ApplicationController
    def index
        @investors = Investor.all
    end
    def new
        @investor = Investor.new
    end
    def edit
        @investor = Investor.find(params[:id])
    end
    def update
        @investor = Investor.find(params[:id])
        
        if @investor.update(investor_params)
            redirect_to @investor
        else
            render 'edit'
        end
    end
    def create
        @investor = Investor.new(investor_params)
 
        if @investor.save
            redirect_to @investor
        else
            render 'new'
        end
    end
    def show
        @investor = Investor.find(params[:id])
    end
    
    private
        def investor_params
            params.require(:investor).permit(:user_name, :password, :image_path, :money)
        end
end
