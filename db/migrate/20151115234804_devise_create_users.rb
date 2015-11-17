class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email, default: ""
      t.string :provider, index: true, null: false
      t.string :uid, index: true, null: false
      t.string :nickname, null: false
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
