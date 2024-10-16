## RADIOHEAD - ARPGEGGI
## Gruppo: Francesco Moretti, Filippo Paris, Giorgio Mattina

use_bpm 153

$list = [0.8, 0.9, 1, 1.1, 1.2]

# CHORDS MAIN GUITAR
accordo1 = [:e5, :g4, :e4]
accordo2 = [:e5, :a4, 66]
accordo3 = [:a5, 73, :a4]
accordo4 = [78, :b4, :g4]

# CHORDS SECOND GUITAR
accordo5 = [:g5, :e5, :d5]
accordo6 = [:g4, :d5, :e5]
accordo7 = [:a4, :e5, 78]
accordo8 = [:a5, :e5, 73]

# DRUMS
define :kick_snare do
  sample :bd_tek, amp: 3, release: 0.4  # Kick drum
  sleep 0.5
  sample :bd_tek, amp: 3  # Kick drum
  sleep 0.5
  with_fx :reverb, room: 0.1, mix: 0.3 do
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 1.25
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 1.25
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 1.25
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.25
  end
  
  sample :bd_tek, amp: 3, release: 0.6 # Kick drum
  sleep 1
  with_fx :reverb, room: 0.1, mix: 0.3 do
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 1.25
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 1.25
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 1.25
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.75
    sample :drum_snare_hard, sustain: 0.1, amp: choose($list)
    sleep 0.25
  end
end

define :hihat do
  sample :drum_cymbal_closed, rate: 4, sustain: 0.03, amp: 5
  sleep 0.5
end

# ARPEGGI MAIN GUITAR
define :play_arpeggio do |note|
  use_synth :piano
  with_fx :reverb, amp: 2, room: 1 do
    for i in 0..2 do
      play note[i]
      sleep 0.5
    end
  end
end

# ARPEGGI SECOND GUITAR
define :play_2nd_arpeggio do |note|
  use_synth :pluck
  with_fx :reverb, amp: 1.5, room: 0.4 do
    for i in 0..2 do
      play note[i]
      sleep 0.5
    end
    
    play note[0]
    sleep 0.5
    play note[2]
    sleep 0.5
  end
end

define :play_3rd_arpeggio do |note|
  use_synth :pluck
  with_fx :reverb, amp: 1.5, room: 0.4 do
    for i in 0..2 do
      play note[i]
      sleep 0.5
    end
    
    play note[0]
    sleep 0.5
    play note[1]
    sleep 0.5
  end
end


define :play_4th_arpeggio do |note|
  use_synth :pluck
  with_fx :reverb, amp: 1.5, room: 0.4 do
    for i in 0..2 do
      play note[i]
      sleep 0.5
    end
    
    play note[1]
    sleep 0.5
    play note[2]
    sleep 0.5
  end
end

#--------------------------------------------------------------------------------
#STICKS
in_thread do
  for i in 0..3 do
    sample :drum_cowbell, amp: 5, hpf_attack: 10
    sleep 1
  end
end

# DRUMS
in_thread do
  sleep 4
  loop do
    hihat
  end
end

in_thread do
  sleep 4
  loop do
    kick_snare
  end
end

# MAIN GUITAR
in_thread do
  sleep 20
  loop do
    10.times do
      play_arpeggio(accordo1)
    end
    
    11.times do
      play_arpeggio(accordo2)
    end
    
    11.times do
      play_arpeggio(accordo3)
    end
    
    10.times do
      play_arpeggio(accordo4)
    end
    
    play :d5
    sleep 0.5
    play :g4
    sleep 0.5
  end
end

# SECOND GUITAR
in_thread do
  sleep 68 # start with accordo4
  loop do
    6.times do
      play_2nd_arpeggio(accordo5)
    end
    
    play :g5
    sleep 0.5
    play :e5
    sleep 0.5
    
    6.times do
      play_2nd_arpeggio(accordo6)
    end
    
    play :g4
    sleep 0.5
    play :d5
    sleep 0.5
    
    play :e5
    sleep 0.5
    play :a4
    sleep 0.5
    play :e5
    sleep 0.5
    
    5.times do
      play_3rd_arpeggio(accordo7)
    end
    
    play :a4
    sleep 0.5
    play :e5
    sleep 0.5
    play 78
    sleep 0.5
    play 73
    sleep 0.5
    
    play :e5
    sleep 0.5
    play 73
    sleep 0.5
    play :e5
    sleep 0.5
    
    4.times do
      play_4th_arpeggio(accordo8)
    end
    
    play :a5
    sleep 0.5
  end
end
