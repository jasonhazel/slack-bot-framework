class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.string :slack_id
      t.timestamps
    end
  end
end
