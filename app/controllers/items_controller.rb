class ItemsController < ApplicationController
  # ログインしていないユーザーをログインページへ
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def index
    # itemの情報を全て取得
    @items = Item.all
  end

  def new
    # itemの新しいインスタンスを作成
    @item = Item.new
  end
end
