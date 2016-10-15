class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: true do |t|
      t.string :slack_id
      t.string :gamertag
      t.string :platform
    end
  end
end
