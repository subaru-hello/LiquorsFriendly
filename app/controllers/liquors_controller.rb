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

  def edit
    @liquor = Liquor.find(params[:id])
  end

  def update
    @liquor = Liquor.find(params[:id])

    if @liquor.update(liquor_params)
      redirect_to @liquor
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @liquor = Liquor.find(params[:id])
    @liquor.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def liquor_params
    params.require(:liquor).permit(:name, :price, :percentage, :amount)
  end
end
