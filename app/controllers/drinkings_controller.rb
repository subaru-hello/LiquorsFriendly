# frozen_string_literal: true

class DrinkingsController < ApplicationController
  before_action :set_drinking, only: %i[show edit update destroy]

  # GET /drinkings or /drinkings.json
  def index
    @drinkings = Drinking.all
    start_date = params.fetch(:start_date, Date.today).to_date
    @drinkings = Drinking.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @total_drinkings = Drinking.where(starts_at: start_date.beginning_of_month..start_date.end_of_month).pluck(:id).count
  end

  # GET /drinkings/1 or /drinkings/1.json
  def show; end

  # GET /drinkings/new
  def new
    @drinking = Drinking.new
  end

  # GET /drinkings/1/edit
  def edit; end

  # POST /drinkings or /drinkings.json
  def create
    @drinking = Drinking.new(drinking_params)

    if @drinking.save
      redirect_to drinking_url(@drinking), notice: 'Drinking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drinkings/1 or /drinkings/1.json
  def update
    respond_to do |_format|
      if @drinking.update(drinking_params)
        redirect_to drinking_url(@drinking), notice: 'Drinking was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /drinkings/1 or /drinkings/1.json
  def destroy
    @drinking.destroy

    respond_to do |format|
      format.html { redirect_to drinkings_url, notice: 'Drinking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_drinking
    @drinking = User.first.drinkings.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def drinking_params
    params.require(:drinking).permit(:name, :starts_at)
  end
end
