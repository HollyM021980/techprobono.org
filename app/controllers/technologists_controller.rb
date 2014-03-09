class TechnologistsController < ApplicationController
  respond_to :json, :html
  layout 'technologist'

  def show
    respond_with(technologist_repo.find(params[:id]))
  end

  def create
    tech = technologist_repo.create(params)
    respond_to do |format|
      if tech
        create_session(tech)
        format.json { render json: tech, status: :created }
        format.html { redirect_to technologist_path(tech) }
      else
        format.json { render json: tech.errors,
                           status: :unprocessable_entity }
      end
    end
  end

  def update
    if current_user
      tech = technologist_repo.update(current_user, params)
      respond_to do |format|
        if tech
          format.json { render json: tech, status: :accepted }
        else
          format.json { render json: tech.errors,
                        status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.json { render json: {}, status: :unauthorized}
      end
    end
  end

  private

  def technologist_repo
    Repos::Technologist.new
  end
end
