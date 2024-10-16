use_bpm 150

#first part: intro tapping, 24 times drum loop, with splash
#pause: no drums
#second part:




#INTRO TAPPING
4.times do
  sample :perc_snap
  sleep 1
end



##############################################################
#DRUMS


define :drum1 do
  
  #Kick
  in_thread do
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_heavy_kick,amp: 0.9
    sleep 7.5
    sample :drum_heavy_kick
    sleep 8
    
  end
  
  
  #hihats
  in_thread do
    8.times do
      sample :drum_cymbal_pedal, amp: 1, pan: -0.2
      sleep 0.50
      sample :drum_cymbal_pedal, amp: 1-rand()/2, pan: 0.2
      sleep 0.50
      cue :hihat_snare
      sample :drum_cymbal_pedal, amp: 1-rand()/2, pan: 0.2
      sleep 0.50
      sample :drum_cymbal_pedal, amp: 1-rand()/2, pan: 0.2
      sleep 0.50
    end
  end
  
  
  #snare
  in_thread do
    8.times do
      sync :hihat_snare
      sample :drum_snare_hard
      sleep 0.75
      sample :drum_snare_soft, amp: 1
      sleep 0.25+1
    end
  end
  
  
  #new elements
  in_thread do
    sleep 7.5
    sample :perc_door,amp: 0.5, pan:1
  end
  
  in_thread do
    sample choose([:ambi_dark_woosh,:ambi_swoosh]), pan: choose([-1,+1]), amp: 0.2
  end
  
end


2.times do
  drum1
  sleep 16
end

in_thread do
  8.times do
    drum1
    in_thread do
      #loop do
      sample :drum_splash_soft
      sleep 16
      #end
    end
    sleep 16
  end
end


##############################ARPEGGI##############################

use_synth :pluck
in_thread do
  with_fx :reverb do
    arp([:d4, :g3, :e3,:d4, :g3, :e3,:d4, :g3, :e3,:d4, :g3, :e3,:d4, :g3, :e3, :d4, :g3], 2)
    
    arp([:e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3], 2)
    
    arp([:a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4], 2)
    
    cue :arp2
    arp([:fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3], 2)
    
    arp([:d4, :g3, :e3,:d4, :g3, :e3,:d4, :g3, :e3,:d4, :g3, :e3,:d4, :g3, :e3, :d4, :g3], 2)
    
    arp([:e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3, :g3, :e4, :a3], 2)
    
    arp([:a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4, :a3, :a4, :cs4], 2)
    
    arp([:fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3, :g3, :fs4, :b3], 2)
  end
end

in_thread do
  with_fx :reverb do
    sync :arp2
    arp([:d4, :g4, :e4, :g4, :e4, :d4, :g4, :e4, :g4, :e4, :d4, :g4, :e4, :g4, :e4, :d4], 2)
    
    arp([:g3, :d4, :e4, :d4, :e4, :g3, :d4, :e4, :d4, :e4, :g3, :d4, :e4, :d4, :e4, :g3], 2)
    
    arp([:a3, :e4, :fs4, :e4, :fs4, :a3, :e4, :fs4, :e4, :fs4, :a3, :e4, :fs4, :e4, :fs4, :a3], 2)
    
    arp([:cs4, :e4, :a4, :e4, :a4, :cs4, :e4, :a4, :e4, :a4, :cs4, :e4, :a4, :e4, :a4, :cs4], 2)
    
    arp([:d4, :g4, :e4, :g4, :e4, :d4, :g4, :e4, :g4, :e4, :d4, :g4, :e4, :g4, :e4, :g4], 2)
  end
end


use_synth :bass_foundation
in_thread do
  2.times do
    play :e1, sustain: 0.7
    sleep 0.5
    play :e1, sustain: 0.7
    sleep 0.5
    play :g1, sustain: 0.7
    sleep 1
    play :d2, sustain: 0.7
    sleep 1
    play :e2, sustain: 3, sustain_level: 0.6, release: 3
    sleep 13
    
    play :fs1, sustain: 3, sustain_level: 0.6, release: 3
    sleep 16
    
    play :a1, sustain: 3, sustain_level: 0.6, release: 3
    sleep 16
    
    play :fs1, sustain: 0.7
    sleep 0.5
    play :fs1, sustain: 0.7
    sleep 0.5
    play :g1, sustain: 1
    sleep 1
    play :fs1, sustain: 1
    sleep 1
    play :e1, sustain: 1
    sleep 1
    play :e2, sustain: 3, sustain_level: 0.6, release: 3
    sleep 13
  end
end

