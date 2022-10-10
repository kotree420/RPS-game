def convert(num)
  case num
  when 0
    rps = "グー"
  when 1
    rps = "チョキ"
  when 2
    rps = "パー"
  end
  return rps
end

def rps_judge(my_num,partner_num)
  if (my_num == 0 && partner_num == 1)\
    || (my_num == 1 && partner_num == 2)\
    || (my_num == 2 && partner_num == 0)
    result = "win"
  elsif (my_num == 0 && partner_num == 2)\
    || (my_num == 1 && partner_num == 0)\
    || (my_num == 2 && partner_num == 1)
    result = "lose"
  else
    result = "draw"
  end
  return result
end

def ltw(my_num)
  partner_num = rand(4)
  if (my_num == 0 && partner_num == 0)\
    || (my_num == 1 && partner_num == 1)\
    || (my_num == 2 && partner_num == 2)\
    || (my_num == 3 && partner_num == 3)
    result = "win"
  else
    result = ""
  end
  return result
end

while true 
#全体の結果
  while true 
  #じゃんけん
    puts "じゃんけん..."
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"

    my_rps_num = gets.chomp.to_i
    if my_rps_num == 3
      break
    elsif my_rps_num >= 4
      puts "0(グー)1(チョキ)2(パー)3(戦わない)のどれかを入力してください"
      next
    end
    my_rps = convert(my_rps_num)

    partner_rps_num = rand(3)
    partner_rps = convert(partner_rps_num)

    puts "ホイ！"
    puts "----------------"

    puts "あなた:" + my_rps + "を出しました。"
    puts "相手:" + partner_rps + "を出しました。"

    rps_result = rps_judge(my_rps_num,partner_rps_num)

    if rps_result == "draw"
      puts "あいこで〜"
      next
    else 
      break
    end
  end

  if my_rps_num == 3
    break
  end

  while true
  #あっち向いてホイ
    if rps_result == "win"
      puts "あっち向いて〜"
      puts "0(上)1(下)2(左)3(右)"
      my_point = gets.chomp.to_i
      if my_point >= 4
        puts "0〜3の数字を入力してください"
        next
      end
      ltw_result = ltw(my_point)
      if ltw_result == "win"
        total_result = "win"
        break
      else
        total_result = ""
        break
      end
    elsif rps_result == "lose"
      puts "あっち向いて〜"
      puts "0(上)1(下)2(左)3(右)"
      my_face = gets.chomp.to_i
      if my_face >= 4
        puts "0〜3の数字を入力してください"
        next
      end
      ltw_result = ltw(my_face)
      if ltw_result == "win"
        total_result = "lose"
        break
      else
        total_result = ""
        break
      end
    end
  end

  if total_result == "win" || total_result =="lose"
    break
  else
    next
  end
end

if total_result == "win"
  puts "あなたの勝ちです"
elsif total_result == "lose"
  puts "あなたの負けです"
end