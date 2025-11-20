class ChangePriceTypeInTweets < ActiveRecord::Migration[6.1]
  def change
    change_column :tweets, :price, :string
  end
end
