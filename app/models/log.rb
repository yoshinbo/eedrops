class Log < ActiveRecord::Base
  attr_accessible :comment, :g_min, :l_min, :phrase, :r_min, :s_min, :user_id
end
