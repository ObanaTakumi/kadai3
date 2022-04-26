puts "-----------------------------------------"
puts "あっち向いてホイを始めます 半角英数字でお願い"
puts "-----------------------------------------"

# ジャンケンの仕組み
def janken
  puts "最初はグー、じゃんけん..."
  puts "0(グー)1(チョキ)2(パー)3(おしまい)"
  puts"------------------------------"
  player_hand = gets.to_i

  if !(player_hand == 0 || player_hand == 1 || player_hand ==2)
    player_hand = 3
  end

  program_hand = rand(3)
  jankens = ["グー","チョキ","パー","おしまい"]
    puts "あなた:#{jankens[player_hand]}\nロボ君:#{jankens[program_hand]}"

  if player_hand ==3 || program_hand == 3
    puts"楽しかったよ！また遊ぼう！"
    puts"------------------------------"
    exit
  end

  number = player_hand - program_hand
  if number == 0
    puts "あいこだよ。もういっかい。"
    puts"------------------------------"
    @result = :draw

  elsif number == -1 || number == 2
    puts "あなたがじゃんけんに勝ちました。あっちむいて・・・"
    @result = :win

  elsif number == 1 || number == -2
    puts"ロボ君がジャンケンに勝ったよ。あっちむいて・・・"
    @result = :lose
  end
end

# あっち向いてホイの仕組み
def look_this_way
  puts "0(上)1(下)2(左)3(右)"
  puts"------------------------------"
  player_hand2 = gets.to_i
  program_hand2 =rand(4)
  directions = ["上","下","左","右"]
  puts"ホイ！"
  puts "あなた:#{directions[player_hand2]}\nロボ君:#{directions[program_hand2]}"
  puts"------------------------------"

  if player_hand2 == program_hand2
    return true
  else
    false
  end
end

# じゃけんの勝敗によって分岐
def junken_branch
  loop do
    janken
    if @result != :draw
      break
    else
      next
    end
  end
end

# あっち向いてホイの勝敗によって分岐
def look_this_way_branch
  loop do
    if look_this_way == true
      puts "勝敗が決まる"
      break
    else
      junken_branch
    end
  end
end

# 結果を出力
def result_table
  if @result == :win
    puts"あなたの勝ちです"
    else
    puts"あなたの負けです"
  end
end

junken_branch
look_this_way_branch
result_table