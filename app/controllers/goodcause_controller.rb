class GoodcauseController < ApplicationController
  respond_to :json

  def show
    respond_with('OK')
  end

  def create
    respond_to do |format|
      format.json { render json: {}, status: :created }
    end
  end
end
