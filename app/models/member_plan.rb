class MemberPlan < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :plan

  def self.monthly_plan
    { start_date: date, end_date: date + 1.month, is_active: true }
  end

  def self.quarterly_plan
    {start_date: date, end_date: date + 3.month, is_active: true }
  end

  def self.yearly_plan
    {start_date: date, end_date: date + 1.year, is_active: true }
  end

  def self.date
    DateTime.current
  end
end
