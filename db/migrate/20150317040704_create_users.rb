class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :admin
      t.datetime :last_signed_in_at

      t.timestamps null: false
    end
  end
end
