class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      # 説明
      t.text :description, null: true
      # 締め切り
      t.datetime :target_at, null: true
      # タスク完了日
      t.datetime :completed_at, null: true
      # タスク完了したか
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
