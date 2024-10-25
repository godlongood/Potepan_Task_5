# あっち向いてホイ

begin #rescue

def janken
    puts "じゃんけん..."
    puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
    player_hand= gets.to_i #数字へ変換
    program_hand = rand(0..2) #ランダム出力

    # プレイヤーが3を選んだら終了
    if player_hand == 3
      puts "じゃんけんを終了します"
      return
    end

    # 無効な入力を防ぐためのチェック
    if player_hand < 0 || player_hand > 3
      puts "無効な入力です。0から3までの数字を入力してください。"
      return janken
    end

    # じゃんけんの手を表示
    hands = ["グー", "チョキ", "パー"] # 手の配列
    puts "ホイ！"
    puts "---------------------------------"
    puts "あなた: #{hands[player_hand]}!" # プレイヤーの手
    puts "相手: #{hands[program_hand]}!"  # プログラムの手

    #勝ち！
    if  (player_hand == 0 && program_hand == 1) || # グー チョキ or
        (player_hand == 1 && program_hand == 2) || # チョキ パー or
        (player_hand == 2 && program_hand == 0)    # パー グー
        puts "勝ち！ あっちむいてホイに進みます"
        puts "---------------------------------"
        attimuitehoi("win") #上のメソッド呼び出し
    #あいこ！
    elsif
        (player_hand == program_hand)
        puts "あいこ! じゃんけんに戻ります"
        puts "---------------------------------"
        janken # あいこの場合は再度じゃんけん
    #負け！
    else
        (player_hand == 0 && program_hand == 2) || # グー パー or
        (player_hand == 1 && program_hand == 0) || # チョキ グー or
        (player_hand == 2 && program_hand == 1)    # パー チョキ
        puts "負け! あっち向いてホイに進みます"
        puts "---------------------------------"
        attimuitehoi("lose") #上のメソッド呼び出し
    end
end

def attimuitehoi(result)

  # あっち向いてホイの処理
  puts "あっち向いて〜"
  puts "0(上) 1(下) 2(左) 3(右)"
  
  player_direction = gets.to_i # プレイヤーの方向
  program_direction = rand(0..3) # プログラムの方向ランダム
  
  directions = ["上", "下", "左", "右"] # 方向配列
  puts "ホイ！"
  puts "---------------------------------"
  puts "あなた: #{directions[player_direction]}"
  puts "相手: #{directions[program_direction]}"

  # 無効な入力を防ぐためのチェック
  if player_direction < 0 || player_direction > 3
    puts "無効な入力です。0から3までの数字を入力してください。"
    return attimuitehoi(result) #結果を引き継いであっち向いてホイを再開
  end
  
  # 勝負判定
  if player_direction == program_direction
    if result == "win" # attimuitehoi(win)
      puts "あなたの勝ちです！"
    elsif result == "lose" # attimuitehoi(lose)
      puts "あなたの負けです。"
    end
  else
    puts "引き分けです！ じゃんけんに戻ります"
    return janken # ジャンケンに戻る
  end
end

janken #メソッド呼び出し

#interruptエラーが発生した際に以下のエラーメッセージを表示して、エラーを正常に終了させる
rescue Interrupt
  puts "\nあっちむいてホイを終了しました。" #\nは段落
  puts "-------------------------------------------"
end #begin





