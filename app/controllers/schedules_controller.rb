class SchedulesController < ApplicationController
  before_action :set_schedule, only: [ :show, :edit, :update, :destroy ]

  def index
    @schedules = Schedule.order(created_at: :desc)
    @today = Time.zone.today
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: "予定を作成しました"
    else
      flash.now[:alert] = "予定の作成に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to schedules_path, notice: "予定を更新しました"
    else
      flash.now[:alert] = "予定の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path, notice: "予定を削除しました"
  end

  private

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo)
  end
end
