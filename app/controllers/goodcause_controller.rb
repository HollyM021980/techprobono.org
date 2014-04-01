class GoodcauseController < ApplicationController
  respond_to :json, :html
  layout 'goodcause'

  def show
    respond_with(goodcause_repo.find(params[:id]))
  end

  def create
    goodcause = goodcause_repo.create(goodcause_params)
    respond_to do |format|
      if goodcause
        format.json { render json: goodcause, status: :created }
      else
        format.json { render json: goodcause.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  private

  def goodcause_params
    params.require(:goodcause)
          .permit(:name, :email,
                  contacts_attributes: [:contact_type, :value])
  end

  def goodcause_repo
    Repos::Goodcause.new
  end

end
