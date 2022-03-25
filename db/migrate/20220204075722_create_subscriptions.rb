class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :user_name
      t.string :user_email
      t.references :event, null: true, foreign_key: true, index: true
      t.references :user, null: true, foreign_key: true, index: true

      t.timestamps
    end
  end
end
