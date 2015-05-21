class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.string :ability_to_communicate
      t.string :professional_quality
      t.string :ability_to_learn
      t.string :speech_ability
      t.string :comprehensive_ability
      t.timestamps null: false
    end
  end
end
