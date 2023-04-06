class Schedule < ApplicationRecord
  validates :title, presence :true, length {maximum: 20}
  validates :start, presence :true
  validates :end, presence :true, comparison: {greater_than: :start}
  validates :memo, presence :true, length {maximum: 500}
end
