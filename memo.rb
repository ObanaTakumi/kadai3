require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.chomp.to_s

#続きを書いていきましょう！！(ifで条件分岐)
if memo_type == "1"
       puts "拡張子を除いたファイルを入力して下さい"
       memo_title = gets.chomp
       puts "メモしたい内容を記入してください"
       puts "完了したらControl+Dを押してください"
       memo_inside = STDIN.read
       CSV.open("#{memo_title}.csv", 'w') do |csv|
        csv << ["#{memo_inside}"]
       end
   else
    memo_type == "2"
    puts "編集するファイルを入力してください"
    memo_title = gets.chomp
    puts "完了したらControl+Dを押してください"
    memo_inside = STDIN.read
    CSV.open("#{memo_title}.csv", 'a') do |csv|
     csv << ["#{memo_inside}"]
    end
end

# まずはmemo.rbなどのファイルを作成しましょう！
# 1行目にrequire "csv"と記述します！(csvファイル読み込み rubyなどで調べてみましょう！)
# 2行目にputs "1(新規でメモを作成) 2(既存のメモ編集する)"と記述していきましょう！
# memo_type = gets.to_sでユーザーに入力してもらった値をmemo_typeに代入します。
# その後はif を用いて1と2の場合で記述していけば完成です！