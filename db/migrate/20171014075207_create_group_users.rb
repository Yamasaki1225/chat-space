class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references :group, null: false, foregin_key: true
      t.references :user, null: false, foregin_key: true
      t.timestamps
    end
  end
end
