class GoodcauseController < ApplicationController
  respond_to :json

  def show
    respond_with('OK')
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
          .permit(:name, :email)
  end

  def goodcause_repo
    Repos::Goodcause.new
  end

end
