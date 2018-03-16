class Manager::CompaniesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: { companies: Company.all }
      end
    end
  end
end
