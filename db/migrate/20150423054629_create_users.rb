class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :name
      t.string :password
      t.string :email
      t.string :identity
      t.timestamps null: false
    end
  end
end
