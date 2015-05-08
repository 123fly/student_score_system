class AddNumberToScores < ActiveRecord::Migration
  def change
    add_column :scores, :number, :string
  end
end
