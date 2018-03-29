class CompaniesController < ApplicationController
  before_action :check_params, only: :create

  def new
    @skills = Skill.all
    @company = Company.new
  end

  def create
    @company = Company.new load_company_params
    begin
      ActiveRecord::Base.transaction do
        @company.save!
        save_user
        save_company_skill
        flash[:notice] = t(".success")
      end
    rescue
      flash[:notice] = t(".fail")
    end
    redirect_to new_companies_path
  end

  private
  def save_user
    @user = User.new(email: params[:email], password: params[:password],
      company_id: @company.id, company_role: :owner)
    @user.save!
  end

  def save_company_skill
    params[:skills].each do |skill|
      company_skill = CompanySkill.new company_id: @company.id, skill_id: skill
      company_skill.save!
    end
  end

  def load_company_params
    params[:company].permit(:name, :description, :address, :phone)
  end

  def check_params
    if params[:password] != params[:password_confirmation]
      flash[:notice] = t(".create.password_not_match")
      redirect_to new_companies_path
    elsif !params[:skills] || params[:skills].size < Settings.company_skills
      flash[:notice] = t(".create.not_enough_skill")
      redirect_to new_companies_path
    end
  end
end
