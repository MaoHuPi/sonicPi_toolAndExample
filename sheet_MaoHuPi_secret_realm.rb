run_file './alda_play.rb'

with_fx :reverb do
  live_loop :piano do
    alda_play "
    (tempo! 75)
    (quant! 200)
    (volume! 15)
    hoover:
    o4
    |  e4 <a8     >d  c <b | >e4  e8    d   g <b |
    | >c4 <b16 >c  d8 c <b |  a4  b16 a g+8 r  e |
    "
  end
  
  live_loop :piano2 do
    alda_play "
    (tempo! 150)
    (quant! 250)
    (volume! 65)
    #pretty_bell:
    dtri:
    o5
    |  e4 <a8     >d  c <b | >e4  e8    d   g <b |
    | >c4 <b16 >c  d8 c <b |  a4  b16 a g+8 r  e |
    "
  end
end
