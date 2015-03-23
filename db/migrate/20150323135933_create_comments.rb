class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.string :email
      t.string :message

      t.timestamps null: false
    end
  end
end
