class Admin::CompaniesController < ApplicationController
  before_action :load_company, only: [:edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def search
    if params[:q].present?
      @companies = Company.search(params[:q])
      binding.pry
    else
      @companies = Company.all
    end
  end

  def edit
  end

  def update
    if @company.update_attributes company_params
      flash[:success] = "update success"
      redirect_to admin_companies_path
    else
      flash[:notice] = "fails"
      redirect_to :back
    end
  end

  def destroy
    if @company.destroy
      flash[:success] = "delete success"
      redirect_to admin_companies_path
    else
      flash[:notice] = "fails"
      redirect_to :back
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :description, :address, :phone)
  end

  def load_company
    @company = Company.find_by id: params[:id]
  end
end
