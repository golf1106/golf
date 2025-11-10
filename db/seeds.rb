# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Tag.create([
  { name: '初心者向け',category:"特徴" },
  { name: '上級者向け',category:"特徴" },
  { name: 'レディース',category:"特徴" },
  { name: '飛距離重視',category:"特徴" },
  { name: '方向性重視',category:"特徴" },
  { name: '操作性重視',category:"特徴" },
  { name: 'スライス改善',category:"特徴" },
  { name: 'フック改善',category:"特徴" },
  { name: '高弾道',category:"特徴" },
  { name: 'コスパ重視',category:"その他" },
  { name: 'ドライバー',category:"種類" },
  { name: 'ウッド',category:"種類" },
  { name: 'ユーティリティー',category:"種類"}
  { name: 'アイアン',category:"種類" },
  { name: 'ウェッジ',category:"種類" },
  { name: 'パター',category:"種類"},
  { name: 'テーラーメイド',category:"メーカー" },
  { name: 'キャロウェイ',category:"メーカー" },
  { name: 'スリクソン',category:"メーカー"  },
  { name: 'ピン',category:"メーカー" },
  { name: 'タイトリスト',category:"メーカー" },
  { name: 'ミズノ',category:"メーカー"},
  { name: 'ブリヂストン',category:"メーカー"},
  { name: 'ヤマハ',category:"メーカー"},
  { name: 'コブラ',category:"メーカー"},
])