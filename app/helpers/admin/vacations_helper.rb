module Admin::VacationsHelper
  def statuses
    Vacation::STATUSES.map { |status | [t("vacation.statuses.#{status}"), status] }
  end
end
