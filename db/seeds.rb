# frozen_string_literal: true

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp == 'Y'
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all
User.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

50.times do
  Book.create!(
    title: Faker::Book.title,
    memo: Faker::Book.genre,
    author: Faker::Book.author,
    picture: picture_file('no-image.png')
  )
end

50.times.each do |n|
  User.create!(
    name: "test#{n + 1}",
    email: "test#{n + 1}@example.com",
    password: 'p@ssw0rd',
    postal_code: '123-4567',
    address: '東京都新宿区',
    information: "はじめまして。\n test#{n+1}と申します。"
  )
end

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output
