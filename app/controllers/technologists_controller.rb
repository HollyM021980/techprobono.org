class TechnologistsController < ApplicationController
  respond_to :json

  def show
    respond_with('OK')
  end

  def create
    render json: {status: :ok}
  end
end
