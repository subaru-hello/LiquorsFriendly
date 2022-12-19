# frozen_string_literal: true

class DrinkingsController < ApplicationController
  before_action :set_drinking, only: %i[show edit update destroy]

  # GET /drinkings or /drinkings.json
  def index
    @drinkings = User.first.drinkings.all
    start_date = params.fetch(:start_date, Date.today).to_date
    @drinkings = User.first.drinkings.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @total_drinkings = User.first.drinkings.where(starts_at: start_date.beginning_of_month..start_date.end_of_month).pluck(:id).count
  end

  # GET /drinkings/1 or /drinkings/1.json
  def show; end

  # GET /drinkings/new
  def new
    @drinking = User.first.drinkings.new
  end

  # GET /drinkings/1/edit
  def edit; end

  # POST /drinkings or /drinkings.json
  def create
    @drinking = User.first.drinkings.new(drinking_params)

    if @drinking.save
      redirect_to @drinking, notice: "#{@drinking.name}を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drinkings/1 or /drinkings/1.json
  def update
    if @drinking.update(drinking_params)
      redirect_to @drinking, notice: '飲み会予定を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /drinkings/1 or /drinkings/1.json
  def destroy
    @drinking.destroy

    redirect_to drinkings_url, notice: '飲み会予定を削除しました'
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
