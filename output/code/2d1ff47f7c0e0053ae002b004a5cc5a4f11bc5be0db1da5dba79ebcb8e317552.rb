use_bpm 165

# Main beat loop
live_loop :beat do
  sample :drum_heavy_kick, amp: 1
  sleep 0.5
  sample :drum_heavy_kick, amp: 1
  sleep 0.5
  sample :drum_snare_hard, amp: 1
  sleep 0.5
  sample :drum_snare_soft, amp: 1
  sleep 0.25
  sample :drum_snare_soft, amp: 1
  sleep 0.25
end
#live_loop :crash do
#  sample :drum_cymbal_open, amp: 1
#  sleep 1
#end
live_loop :dudut do
  sample :glitch_robot2
  sleep 7.5
  sample :glitch_robot1
  sleep 5
  
end
live_loop :dudut2 do
  sample :elec_blip, amp: 1.5
  sleep 0.25
end



fm1 = [[62, 0.5], [55, 0.5], [52, 0.5]]
fm2 = [[64, 0.5], [57, 0.5], [54, 0.5]]
fm3 = [[69, 0.5], [61, 0.5], [57, 0.5]]
fm4 = [[66, 0.5], [59, 0.5], [55, 0.5]]

def play_seq(seq)
  seq.each do |n|
    play(n[0])
    sleep(n[1])
  end
end


live_loop :chords do
  use_synth :piano
  sync :melody_change
  
  play chord(:E, :m7), decay: 15, amp: 4
  sleep 15
  
  sync :melody_change
  play chord(:Fs, :m7), decay: 16.5, amp: 4
  sleep 16.5
  
  sync :melody_change
  play chord(:A, :major), decay: 15, amp: 4
  sleep 15
  
  sync :melody_change
  play chord(:G, :major7), decay: 16.5, amp: 4
  sleep 16.5
end



live_loop :melody do
  use_synth :rhodey
  
  10.times do
    play_seq(fm1)
  end
  cue :melody_change
  
  11.times do
    play_seq(fm2)
  end
  cue :melody_change
  
  11.times do
    play_seq(fm3)
  end
  cue :melody_change
  
  10.times do
    play_seq(fm4)
  end
  cue :melody_change
end

live_loop :bass do
  use_synth :bass_foundation
  sync :melody_change
  play :E1, decay: 13, amp: 3
  sleep 0.5
  sync :melody_change
  play :Fs1, decay: 13, amp: 3
  sleep 0.5
  sync :melody_change
  play :A2, decay: 13, amp: 3
  sleep 0.5
  sync :melody_change
  play :G1, decay: 13, amp: 3
  sleep 0.5
  
  
end
