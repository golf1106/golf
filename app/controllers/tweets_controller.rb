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
      else
        @tweets = Tweet.none
      end
    end
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

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to action: :index
  end

  private

  def tweet_params
    params.require(:tweet).permit(:club, :price, :point, :image, tag_ids: [])
  end
end
