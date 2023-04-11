class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
    if @schedule.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :schedules
    else
      flash[:alert] = "予定を登録できませんでした"
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(params.require(:schedule).permit(:title, :start_at, :end_at, :all_day, :memo))
      flash[:notice] = "IDが「#{@schedule.id}」の予定を更新しました"
      redirect_to :schedules
    else
      flash[:notice] = "予定を更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :schedules
  end

end
