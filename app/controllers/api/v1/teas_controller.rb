class Api::V1::TeasController < ApplicationController
  def index
    render json: TeaSerializer.new(Tea.all)
  end

  def show
    if Tea.exists?(params[:id])
      render json: TeaSerializer.new(Tea.find(params[:id]))
    else
      render json: {errors: {details: "A tea with this id does not exist"}}, status: 404
    end
  end
end
