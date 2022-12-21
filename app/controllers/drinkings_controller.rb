# frozen_string_literal: true

class DrinkingsController < ApplicationController
  before_action :set_drinking, only: %i[show edit update destroy]
  before_action :authenticate_user!

  def index
    @drinking = policy_scope(Drinking).all
    start_date = params.fetch(:start_date, Date.today).to_date
    @drinkings = policy_scope(Drinking).where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @total_drinkings = policy_scope(Drinking).where(starts_at: start_date.beginning_of_month..start_date.end_of_month).pluck(:id).count
  end

  def show; end

  def new
    @drinking = current_user.drinkings.new
  end

  def edit; end

  def create
    @drinking = current_user.drinkings.new(drinking_params)

    if @drinking.save
      redirect_to @drinking, notice: "#{@drinking.name}を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @drinking.update(drinking_params)
      redirect_to @drinking, notice: '飲み会予定を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @drinking.destroy

    redirect_to drinkings_url, notice: '飲み会予定を削除しました'
  end

  private

  def set_drinking
    @drinking = policy_scope(Drinking).find(params[:id])
  end

  def drinking_params
    params.require(:drinking).permit(:name, :starts_at)
  end
end
