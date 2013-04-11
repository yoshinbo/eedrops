# encoding: utf-8
class Log < ActiveRecord::Base
  attr_accessible :comment, :g_min, :l_min, :phrase, :r_min, :s_min, :user_id

  validates_each :g_min, :l_min, :r_min, :s_min do |record, attr, value|
    record.errors.add(attr, '500時間以下で設定してください。') unless value >= 0 and value <= 500
  end
  validates_each :comment, :phrase do |record, attr, value|
    record.errors.add(attr, '10文字以内に設定してください。') unless value.length <= 255
  end
end
