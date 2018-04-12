class Manager::CompaniesController < ApplicationController
skip_before_action :verify_authenticity_token
  def index
    respond_to do |format|
      format.html
      format.json do
        companies = Company.all
        render json: { data: companies}
      end
    end
  end

  def create
    @company = Company.new company_params
    if @company.save
      render json: { status: "success", message: "Create success" }
    else
      render json: { status: "errors", message: @company.errors.full_messages }
    end
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      render json: { status: "success", message: "Update success" }
    else
      render json: { status: "errors", message: @company.errors.full_messages }
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      render json: { status: "success", message: "Delete success" }
    else
      render json: { status: "errors", message: @company.errors.full_messages }
    end
  end

  private
  def company_params
    params.require(:company).permit(:id, :name, :description, :address, :phone, :email)
  end
end
