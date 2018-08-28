class DeviseCreateUsers < ActiveRecord::Migration[5.2]

  def change
    create_table :users do |t|
      t.string :encrypted_password, null: false, default: ""
      t.string :user_name,          null: false, default: ""
      t.string :full_name,          null: false, default: ""
      t.text   :image_url
      t.timestamps                  null: false
    end

    add_index :users,               :user_name, unique: true

  end
end
