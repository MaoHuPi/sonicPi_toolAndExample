def alda_play sheet
  lastn = ''
  extent = 4
  tempo = 60
  volume = 80
  quant = 80
  pitch = 4
  use_bpm tempo.to_f
  sheet = sheet.split('|').join(' ')
  sheet = sheet.split('>').join(' >')
  sheet = sheet.split('<').join(' <')
  for line in sheet.split("\n")
    for n in line.split(' ')
      ##| print n
      if n[0] == '#' ##| 註解
        break
      elsif n[-1] == ':' ##| 樂器
        sample ":#{n[0..-2]}"
      elsif lastn[0] == '(' ##| 屬性
        case lastn[1..-1]
        when 'tempo'
          tempo = n[0..-2]
          use_bpm tempo.to_f
        when 'tempo!'
          tempo = n[0..-2]
          use_bpm tempo.to_f
        when 'volume'
          volume = n[0..-2]
        when 'volume!'
          volume = n[0..-2]
        when 'quant'
          quant = n[0..-2]
        when 'quant!'
          quant = n[0..-2]
        end
      elsif n[0] == 'o' ##| 音高
        pitch = n[1..-1]
      elsif n[0] == 'r' ##| 休止
        if n.length > 1
          extent = n[1..-1]
        end
        sleep 4/extent.to_f
      elsif n[0] != '(' ##| 音符
        if n[0] == '>'
          pitch = pitch.to_i+1
          n = n[1..-1]
        elsif n[0] == '<'
          pitch = pitch.to_i-1
          n = n[1..-1]
        end
        name = n[0]
        if n.length > 1
          extent = n[1..-1]
        end
        play ":#{name}#{pitch}", amp: volume.to_f/100, release: 4/extent.to_f*quant.to_i/100
        sleep 4/extent.to_f
        print 4/extent.to_f
      end
      lastn = n
    end
  end
end
