# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.create!(
  [
    { title: '野球のルール基礎知識' },
    { title: 'プロ野球選手のトレーニング方法' },
    { title: '野球の歴史とは' },
    { title: 'メジャーリーグと日本プロ野球の違い' },
    { title: '野球用具の選び方' },
    { title: '野球のポジション紹介' },
    { title: '野球のポジション' },
  ])
