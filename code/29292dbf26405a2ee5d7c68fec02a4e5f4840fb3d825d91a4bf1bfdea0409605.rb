use_bpm 150


p1 = (([:g4,:c4,:a3].map {|x| [x,0.5]}))*10

p2 = (([:a4,:d4,:b3].map {|x| [x,0.5]}))*10

p3 = (([:d5,:fs4,:d4].map {|x| [x,0.5]}))*10

p4 = (([:b4,:e4,:c4].map {|x| [x,0.5]}))*10

p = p1 + p2 + p3 + p4

def play_seq(seq)
  amplitude = 0.2
  seq.each do |n|
    play n[0], amp: amplitude, release: 2
    sleep n[1]
    amplitude += 0.05
    amplitude = [amplitude, 1.0].min
  end
end

live_loop :song do
  sample :piano_soft
  play_seq(p)
  sleep 8
end

live_loop :drums1 do
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_heavy_kick
  sleep 7.5
end

live_loop :drums2 do
  sleep 1
  sample :drum_snare_soft, release: 2, sustain: 0.5
  sleep 0.75
  sample :drum_snare_soft, release: 2, sustain: 0.5
  sleep 0.25
end

live_loop :drums3 do
  sample :drum_cymbal_closed
  sleep 0.5
end

live_loop :cinematic do
  
  with_fx :distortion do
    sample :hollow, amp: 0.3, release: 4
    play :c2, amp: 0.5, release: 2
  end
  
  with_fx :reverb, mix: 0.3 do
    play_seq(p1 + p2)
  end
  
  with_fx :echo, mix: 0.3, phase: 0.3, decay: 1.5 do
    play_seq(p3 + p4)
  end
  
  sleep 0.5
  
  with_fx :gverb, mix: 0.4 do
    sample :ambi_haunted_hum, amp: 0.3, rate: 0.5
    sleep 5
  end
  
  sleep 5
  
end
