# frozen_string_literal: true

class LiquorsController < ApplicationController
  def index
    @liquors = Liquor.all
  end

  def show
    @liquor = Liquor.find(params[:id])
  end

  def new
    @liquor = Liquor.new
  end

  def create
    @liquor = Liquor.new(liquor_params)

    if @liquor.save
      redirect_to @liquor
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def liquor_params
    params.require(:liquor).permit(:name, :price, :percentage, :amount)
  end
end
