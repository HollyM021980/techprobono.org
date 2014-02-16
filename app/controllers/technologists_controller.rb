class TechnologistsController < ApplicationController
  respond_to :json, :html
  layout 'technologist'

  def show
    respond_with(technologist_repo.find(params[:id]))
  end

  def create
    tech = technologist_repo.create(technologist_params)
    respond_to do |format|
      if tech
        format.json { render json: tech, status: :created }
        format.html { redirect_to technologist_path(tech) }
      else
        format.json { render json: tech.errors,
                           status: :unprocessable_entity }
      end
    end
  end

  private

  def technologist_params
    params.require(:technologist)
          .permit(:name, :email, :professional_headline,
                  contacts_attributes: [:contact_type, :value])
  end

  def technologist_repo
    Repos::Technologist.new
  end

end
