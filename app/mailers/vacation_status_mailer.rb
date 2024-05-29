class VacationStatusMailer < ApplicationMailer
  def approved_status(vacation_request)
    @user = vacation_request.user
    @begin = vacation_request.start_date
    @end = vacation_request.end_date
    mail to: @user.email, subject: "Your vacation has just been approved!"
  end

  def declined_status(vacation_request)
    @user = vacation_request.user
    @begin = vacation_request.start_date
    @end = vacation_request.end_date
    mail to: @user.email, subject: "Your vacation has just been declined!"
  end
end
