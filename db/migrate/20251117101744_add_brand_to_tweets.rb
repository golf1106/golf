class AddBrandToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :brand, :string
  end
end
