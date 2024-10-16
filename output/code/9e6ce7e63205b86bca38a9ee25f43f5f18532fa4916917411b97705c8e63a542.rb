


#codice temporaneo, lo modificheremo
use_sample_bpm :loop_amen


live_loop :dnb do
  
  sample :loop_amen, amp: 1.5
  sleep 1
end
sleep 3.5


define :weird_fishes_arpeggio do |att|
  2.times do
    [52, 55, 59, 55].each do |nota|
      play nota, attack: att, sustain: 0.25
      sleep 0.25
    end
    
    [55, 59, 62, 59].each do |nota|
      play nota, attack: att, sustain: 0.25
      sleep 0.25
    end
    
    [50, 54, 57, 54].each do |nota|
      play nota, attack: att, sustain: 0.25
      sleep 0.25
    end
    
    [57, 61, 64, 61].each do |nota|
      play nota, attack: att, sustain: 0.25
      sleep 0.25
    end
  end
end


with_fx :reverb, mix: 0.5 do
  live_loop :chitarra, sync: :dnb do
    sample :guit_e_slide, amp: 1
    sleep 4
  end
end


live_loop :arpeggio, sync: :dnb do
  weird_fishes_arpeggio(0)
end


live_loop :counter_melody, sync: :dnb do
  use_synth :hollow
  sleep 8
  2.times do play_pattern_timed [62,64,67,62,64,69, 64,67,67, 64,67,67,64], [0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25,0.25,0.25], amp: 3
    sleep 0
  end
  sleep 8
  2.times do play_pattern_timed [62,64,67,62,64,69, 64,67,67, 64,67,67,64], [0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25,0.5,0.25,0.25,0.25,0.25], amp: 3
    sleep 0
  end
  sleep 4
end


