class Manager::CompaniesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        companies = Company.all
        render json: { data: companies}
      end
    end
  end
end
