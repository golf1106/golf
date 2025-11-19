class AddPointToTweets < ActiveRecord::Migration[7.2]
  def change
    # すでに point カラムがある場合は何もしない
    unless column_exists?(:tweets, :point)
      add_column :tweets, :point, :text
    end
  end
end