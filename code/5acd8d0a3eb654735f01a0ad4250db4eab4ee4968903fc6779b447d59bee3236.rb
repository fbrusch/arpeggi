# Welcome to Sonic Pi


use_bpm 150

mode = :minor
my_scale = scale(:A4,mode)
my_scaleUp = scale(:A5,mode)

A = [my_scale[0], my_scaleUp[2]+1, my_scaleUp[4]]
E = [my_scale[4], my_scale[6] +1, my_scale[1]]
Fsm = [my_scale[5] +1 , my_scaleUp[0], my_scaleUp[2] +1]
D = [my_scale[3], my_scale[5] +1,my_scale[0]]

my_chords = [[[:A4,:major],10], [[:E4, :major],11], [[:Fs4,:minor],11], [[:D4, :major],10]]
my_arpeges = [[A,10], [E,11], [Fsm, 11], [D,10]]


define :play_arpege do
  loop do
    with_fx :reverb, mix: 0.7 do
      with_fx :distortion, distort: 0.2 do
        use_synth :fm
        my_arpeges.each do |arp|
          arp[1].times do
            arp[0].each do |note|
              play note, amp: 0.4
              sleep 0.5
            end
          end
        end
      end
    end
  end
end

define :play_accords do
  loop do
    # sync "/live_loop/arpege"
    with_fx :reverb, mix: 0.7 do
      use_synth :piano
      my_chords.each do |chord|
        chord[1].times do
          play chord(chord[0][0],chord[0][1]), attack: 1.2,release: 4, decay: 0.2, amp: 4
          sleep 1.5
        end
      end
      cue :gogo
    end
  end
end


define :cymbal do
  loop  do
    sample :drum_cymbal_closed, amp: 0.4  # Hi-hat constant
    sleep 0.5
  end
end

define :kick do
  loop do
    sample :bd_tek, amp: 0.5
    sleep 16
  end
end


define :snare do
  loop do
    sample :sn_generic, amp: 0.3
    sleep 0.75
    sample :sn_generic, amp: 0.3, decay: 0.3
    sleep 1.25
  end
end



define :main do
  2.times do
    my_chords.each do |accords|
      with_fx :reverb, mix: 0.7 do
        use_synth :piano
        play chord(accords[0][0],accords[0][1]), attack: 0.5, release: 6, amp: 4
        sleep 5
        
      end
    end
  end
  
  in_thread do
    cymbal
  end
  
  in_thread do
    kick
  end
  
  in_thread do
    
    snare
  end
  
  sleep 16
  
  in_thread do
    play_accords
  end
  
  
  in_thread do
    sync :gogo
    play_arpege
  end
  
end

main




