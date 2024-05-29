class ApplicationMailer < ActionMailer::Base
  default from: %{"VacationPlanner" <mail@vacation.com>}
  layout 'mailer'
end
