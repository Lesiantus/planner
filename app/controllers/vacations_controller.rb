class VacationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    user_id = @user.id
    @vacations = @user.vacations
  end

  def show; end

  def new
    @vacation = Vacation.new
  end

  def create
    @vacation = current_user.vacations.build(vacation_params)

    if @vacation.save
      redirect_to user_vacations_path(current_user), notice: 'Request created'
    else
      render :new
    end
  end

  private

  def vacation_params
    params.require(:vacation).permit(:start_date, :end_date)
  end
end
