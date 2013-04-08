class ToeicLog < ActiveRecord::Base
  attr_accessible :exam_date, :l_score, :r_score, :total_score, :user_id
end
