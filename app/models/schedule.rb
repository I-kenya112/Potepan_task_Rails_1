class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20 }
  validate :start_end_check
    def start_end_check
      if  start_at.present? && end_at.present? &&
        if start_at > end_at 
        errors.add(:end_at, "は開始日より前の日付に登録できません。")  
        end
      end
    end
  validates :memo, length: {maximum:500}
  validates :start_at,presence: true
  validates :end_at,presence: true
  validates :all_day,inclusion: [true, false]
end
