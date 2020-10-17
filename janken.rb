# プレイヤー(自分)に「0 ~ 2」を入力させるロジックを書きます。
class Player
  def hand
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    input_hand = gets.to_i
    while true
      if (0..2).include? input_hand
        return input_hand
      else
        puts "もう一度数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        input_hand = gets.to_i
      end
    end
  end
end
# 敵が「0 ~ 2」の値をランダムで生成するロジックを書きます。
class Enemy
  def hand
    return rand(max = 3)
  end
end
# プレイヤー(自分)が入力した「0 ~ 2」と、敵がランダムで生成した「0 ~ 2」をじゃんけんをさせて、その結果をコンソール上に出力するロジックを書きます。
class Janken
  def pon(player_hand, enemy_hand)
    # 変数「janken」に["グー", "チョキ", "パー"]を代入します。
    janken = ["グー", "チョキ", "パー"]
    #「相手の手は#{敵の生成した値}です。」と出力させます。
    puts "あなたの手は#{janken[player_hand]}です。"
    puts "相手の手は#{janken[enemy_hand]}です。"
    judge = (player_hand - enemy_hand + 3 ) % 3
    case judge
    when 0
      puts "あいこです。あいこで..."
      return true
    when 1
      puts "あなたの負けです。"
    when 2
      puts "あなたの勝ちです。"
    else
      puts "エラー"
    end
    return false
  end
end
# 変数「player」にPlayerをインスタンス化したものを代入します。
 player = Player.new
# 変数「enemy」にEnemyをインスタンス化したものを代入します。
 enemy = Enemy.new
# 変数「janken」にJankenをインスタンス化したものを代入します。
 janken = Janken.new
# 変数「next_game」に「true」を代入します。※「next_game」が「false」にならない限り、永久にwhileで繰り返し処理を実行するためです。
next_game = true
while next_game
   next_game = janken.pon(player.hand, enemy.hand)
end
