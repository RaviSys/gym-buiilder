class MemberPlan < ApplicationRecord
  # Associations
  belongs_to :member
  belongs_to :plan
end
