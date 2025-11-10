class CreateTweets < ActiveRecord::Migration[7.2]
  def change
    create_table :tweets do |t|
      t.string :club
      t.integer :price
      t.text :point

      t.timestamps
    end
  end
end
