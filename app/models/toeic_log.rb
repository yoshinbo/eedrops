# encoding: utf-8
class ToeicLog < ActiveRecord::Base
  attr_accessible :exam_date, :l_score, :r_score, :total_score, :user_id

  validates_each :l_score, :r_score do |record, attr, value|
    record.errors.add(attr, '500点以下で設定してください。') unless value >= 0 and value <= 500
  end
end
