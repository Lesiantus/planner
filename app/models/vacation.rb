class Vacation < ApplicationRecord
  STATUSES = %W[Unconfirmed Confirmed Declined].freeze
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :user

  validate :end_date_before_start_date

  private

  def end_date_before_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, 'должна быть после даты начала отпуска')
    end
  end
end
