use_bpm 40
main = [
  :E4, :C4, :A3, 0,
  :D4, :B3, :G3, 0,
  :C4, :A3, :E3, 0,
  :B3, :G3, :D3, 0
]
live_loop :main do
  for i in main
    play i, attack: 0.01, sustain: 0, release: 1, pan: 0
    sleep 1
  end
end

left = [
  0, 0, 0, :E4,
  0, 0, 0, :D4,
  0, 0, 0, :C4,
  0, 0, 0, :B3
]
live_loop :left do
  for i in left
    play i, attack: 0.01, sustain: 0, release: 1, pan: -1, amp: 0.5
    sleep 1
  end
end

right = [
  :E2, :C2, :E2, :D2,
  :D2, :B1, :D2, :C2,
  ##| :C4, :A3, :E3, 0,
  ##| :B3, :G3, :D3, 0
]
live_loop :right do
  for i in right
    play i, attack: 0.01, sustain: 0, release: 1, pan: 1, amp: 0.2
    sleep 1
  end
end

live_loop :drum do
  def rdrum
    if one_in(2)
      sample :drum_heavy_kick, amp: 0.6, pan: 0.8
      sleep 0.5
    else
      sample :drum_cymbal_closed, amp: 0.5, pan: -0.8
      sleep 0.25
      sample :drum_cymbal_closed, amp: 0.1, pan: 1
      sleep 0.25
    end
  end
  sample :drum_heavy_kick, amp: 1
  sleep 0.5
  rdrum
  rdrum
  rdrum
end
