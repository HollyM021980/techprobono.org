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
    tech = format_contacts(params.dup)
    tech.require(:technologist)
        .permit(:name, :email, :professional_headline,
                contacts_attributes: [:contact_type, :value])
  end

  def format_contacts(params)
    contacts = params[:technologist][:contacts_attributes] || []
    contacts = contacts.map do |k,v|
      {
        contact_type: k,
        value: v
      }
    end
    params[:technologist][:contacts_attributes] = contacts
    params
  end

  def technologist_repo
    Repos::Technologist.new
  end

end
