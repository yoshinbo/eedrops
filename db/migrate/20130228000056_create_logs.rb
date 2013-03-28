class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.integer :r_min
      t.integer :l_min
      t.integer :g_min
      t.integer :s_min
      t.text :phrase
      t.text :comment

      t.timestamps
    end
  end
end
