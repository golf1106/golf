class TweetsController < ApplicationController
  def index
   @tweets = Tweet.all
    @tags = Tag.all
  # キーワード検索
  if params[:search].present?
    keyword = "%#{params[:search]}%"
    @tweets = @tweets.where("club LIKE ? OR price LIKE ?", keyword, keyword)
  end
  # タグ検索
  if params[:tag_ids].present?
    selected_tag_ids = params[:tag_ids].select { |_k, v| v == "1" }.keys
    if selected_tag_ids.any?
      @tweets = @tweets.joins(:tags).where(tags: { id: selected_tag_ids }).distinct
    end
  end
end
  
  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)
    if tweet.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end
  
  def edit
   @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:club, :price,:point,:tag_ids,:image [])
  end
end