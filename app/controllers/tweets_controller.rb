class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tags = Tag.all

  if params[:search].present?
    keyword = "%#{params[:search]}%"
    @tweets = @tweets.where("club LIKE ?", keyword)
  end

  if params[:tag_ids].present?
    tag_ids = params[:tag_ids].keys
    @tweets = @tweets.joins(:tags).where(tags: { id: tag_ids }).distinct
  end

  render :index
end

  def search
    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @tweets = Tweet.where("club LIKE ?", keyword)
    else
      @tweets = Tweet.none
    end
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end

  def show
  @tweet = Tweet.find(params[:id])

  # おすすめクラブ（最新3件）
  @recommended_clubs = Tweet.where.not(id: @tweet.id).order(created_at: :desc).limit(3)

  # 同じメーカーのクラブ（現在のクラブは除外）
  @same_brand_clubs = Tweet.where(brand: @tweet.brand).where.not(id: @tweet.id)
  end


  def edit
    @tweet = Tweet.find(params[:id])
  end
  
 def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private

  def tweet_params
    params.require(:tweet).permit(:club, :price, :point, :image, :price_new, :price_used, tag_ids: [])
  end
end
