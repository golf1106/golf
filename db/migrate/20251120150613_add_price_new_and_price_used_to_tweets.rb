class AddPriceNewAndPriceUsedToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :price_new, :string
    add_column :tweets, :price_used, :string
  end
end
