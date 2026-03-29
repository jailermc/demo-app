class ChangeOrder < ActiveRecord::Base
  belongs_to :cost_sheet

  def self.generate_daily_number(id)
    daily = ChangeOrder.where(cost_sheet_id: id)
    last_record = daily.order(created_at: :desc).first
    if last_record.nil?
      1
    else
      last_record.daily_number + 1
    end
  end
end
