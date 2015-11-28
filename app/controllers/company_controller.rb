class CompanyController < ApplicationController
    def index
        @companies = Company.all
    end
    def new
        @company = Company.new
    end
    def edit
        @company = Company.find(params[:id])
    end
    def update
        @company = Company.find(params[:id])
        
        if @company.update(company_params)
            redirect_to @company
        else
            render 'edit'
        end
    end
    def create
        @company = Company.new(company_params)
        investorp = Investor.first
        investorp.money = investorp.money - 10000
        investorp.save
        if @company.save
            redirect_to @company
        else
            render 'new'
        end
    end
    def show
        @company = Company.find(params[:id])
    end
    
    private
        def company_params
            params.require(:company).permit(:name, :value, :stock)
        end
end
