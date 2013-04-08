class CreateToeicLogs < ActiveRecord::Migration
  def change
    create_table :toeic_logs do |t|
      t.integer :user_id
      t.integer :r_score
      t.integer :l_score
      t.integer :total_score
      t.datetime :exam_date

      t.timestamps
    end
  end
end
