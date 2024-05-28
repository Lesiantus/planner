class Admin::VacationsController < Admin::BaseController
  before_action :vacation_params, only: :update
  def index
    @vacations = Vacation.all
  end

  def update
    @vacation = Vacation.find(params[:id])
    if @vacation.update(vacation_params)
      redirect_to admin_vacations_path, notice: "Status updated successfully"
    else
      flash[:error] = "Failed to update status"
    end
  end

  private

  def vacation_params
    params.require(:vacation).permit(:start_date, :end_date, :status)
  end
end
