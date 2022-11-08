class DrinkingsController < ApplicationController
  before_action :set_drinking, only: %i[ show edit update destroy ]

  # GET /drinkings or /drinkings.json
  def index
    @drinkings = Drinking.all
  start_date = params.fetch(:start_date, Date.today).to_date
  @drinkings = Drinking.where(starts_at: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  # GET /drinkings/1 or /drinkings/1.json
  def show
  end

  # GET /drinkings/new
  def new
    @drinking = Drinking.new
  end

  # GET /drinkings/1/edit
  def edit
  end

  # POST /drinkings or /drinkings.json
  def create
    @drinking = Drinking.new(drinking_params)

    respond_to do |format|
      if @drinking.save
        format.html { redirect_to drinking_url(@drinking), notice: "Drinking was successfully created." }
        format.json { render :show, status: :created, location: @drinking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @drinking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinkings/1 or /drinkings/1.json
  def update
    respond_to do |format|
      if @drinking.update(drinking_params)
        format.html { redirect_to drinking_url(@drinking), notice: "Drinking was successfully updated." }
        format.json { render :show, status: :ok, location: @drinking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @drinking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinkings/1 or /drinkings/1.json
  def destroy
    @drinking.destroy

    respond_to do |format|
      format.html { redirect_to drinkings_url, notice: "Drinking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drinking
      @drinking = Drinking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def drinking_params
      params.require(:drinking).permit(:name, :starts_at)
    end
end
