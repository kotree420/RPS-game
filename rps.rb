def rps_convert(num)
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

def rps_judge(my_rps,partner_rps)
  if (my_rps == "グー" && partner_rps == "チョキ")\
    || (my_rps == "チョキ" && partner_rps == "パー")\
    || (my_rps == "パー" && partner_rps == "グー")
    result = "win"
  elsif (my_rps == "グー" && partner_rps == "パー")\
    || (my_rps == "チョキ" && partner_rps == "グー")\
    || (my_rps == "パー" && partner_rps == "チョキ")
    result = "lose"
  else
    result = "draw"
  end
  return result
end

def rps()
  #じゃんけん処理
  while true 
    puts "じゃんけん..."
    puts "0(グー)1(チョキ)2(パー)3(戦わない)"
    my_rps_num = gets.chomp.to_i
    if my_rps_num == 3
      rps_result = ""
      break
    elsif my_rps_num >= 4
      puts "0(グー)1(チョキ)2(パー)3(戦わない)のどれかを入力してください"
      next
    end
    my_rps = rps_convert(my_rps_num)
    puts "ホイ！"
    puts "----------------"
    partner_rps_num = rand(3)
    partner_rps = rps_convert(partner_rps_num)
    puts "あなた:" + my_rps + "を出しました。"
    puts "相手:" + partner_rps + "を出しました。"
    rps_result = rps_judge(my_rps,partner_rps)
    if rps_result == "draw"
      puts "あいこで〜"
      next
    else 
      break
    end
  end
  return rps_result
end

def ltw_convert(num)
  case num
  when 0
    ltw = "上"
  when 1
    ltw = "下"
  when 2
    ltw = "左"
  when 3
    ltw = "右"
  end
  return ltw
end

def ltw_judge(my_point,partner_point)
  if (my_point == "上" && partner_point == "上")\
    || (my_point == "下" && partner_point == "下")\
    || (my_point == "左" && partner_point == "左")\
    || (my_point == "右" && partner_point == "右")
    result = "match"
  else
    result = ""
  end
  return result
end

def ltw(rps_result)
  while true
    #あっち向いてホイ処理
    puts "あっち向いて〜"
    puts "0(上)1(下)2(左)3(右)"
    my_point_num = gets.chomp.to_i
    if my_point_num >= 4
      puts "0〜3の数字を入力してください"
      next
    end
    my_point = ltw_convert(my_point_num)
    puts "ホイ！"
    puts "----------------"
    partner_point_num = rand(4)
    partner_point = ltw_convert(partner_point_num)
    ltw_result = ltw_judge(my_point,partner_point)
    if rps_result == "win"
      if ltw_result == "match"
        puts "あなた:" + my_point
        puts "相手:" + partner_point
        total_result = "win"
        break
      else
        puts "あなた:" + my_point
        puts "相手:" + partner_point
        total_result = ""
        break
      end
    elsif rps_result == "lose"
      if ltw_result == "match"
        puts "あなた:" + my_point
        puts "相手:" + partner_point
        total_result = "lose"
        break
      else
        puts "あなた:" + my_point
        puts "相手:" + partner_point
        total_result = ""
        break
      end
    end
  end
  return total_result
end

while true 
  rps_result = rps()
  if rps_result == ""
    break
  end
  total_result = ltw(rps_result)
  if total_result == "win"
    puts "あなたの勝ちです"
    break
  elsif total_result =="lose"
    puts "あなたの負けです"
    break
  else
    next
  end
end
