#very weird fishes

arpeggio_re = [:d4, :g3, :e3]
arpeggio_mi = [:e4, :a3, :fs3]
last_mi = [:e4, :a3, :c4]
arpeggio_la = [:a4, :c4, :a3]
time = 0.3


sample :ambi_glass_hum, release: 1.8
sleep 4.5
cue :start



in_thread do
  cue :start
  2.times do
    use_synth :bass_foundation
    with_fx :wobble, phase: 0.9, invert_wave: 1, amp: 0.2 do
      
      10.times do
        play_pattern_timed arpeggio_re, time, release: 0.8
        
      end
      cue :beat
      9.times do
        play_pattern_timed arpeggio_mi, time, release: 0.8
      end
      play_pattern_timed last_mi, time, release: 0.8
      cue :beat2
      5.times do
        play_pattern_timed arpeggio_la, time, release: 0.8
      end
    end
  end
  cue :startoutro
end



in_thread do
  
  4.times do
    sync :beat
    sample :ambi_glass_hum, release: 4.5
    sleep 9
  end
end

in_thread do
  sync :beat2
  sample :ambi_glass_rub, release: 4.5, amp: 0.2
  40.times do
    sample :drum_tom_mid_soft, amp: 0.1
    sleep 0.3
    sample :bass_trance_c, amp: 0.2, release: 0.3
    sleep 0.6
  end
end


sync :startoutro
sample :ambi_glass_hum, release: 6, decay: 5
sleep 9

use_synth :kalimba
with_fx :slicer, phase: 0.3 do |fx|
  in_thread do
    70.times do |i|
      control fx, amp: (5.0 / 70) * i
      sleep 0.1
    end
  end
  20.times do
    play_pattern_timed arpeggio_re, time, release: 0.8
  end
end

use_synth :square
sleep 0.25
play :d5, amp: 0.1, release: 4 #no signal

