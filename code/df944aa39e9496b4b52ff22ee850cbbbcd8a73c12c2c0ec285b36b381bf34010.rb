use_bpm 153

define :arpeggiator do |chord_notes, pattern|
  pattern.each do |p|
    play chord_notes[p]
    sleep 0.5
  end
end

define :pad do
  
  with_fx :hpf , cutoff: 70 do
    with_fx :lpf ,cutoff: 100+ 30*Math.sin(vt * 0.5   * Math::PI) , amp:1 do
      with_fx :bitcrusher , cutoff:100  do
        with_fx :flanger, amp: 0.8 , phase: 2 do
          use_synth :blade
          2.times do
            play_chord [:e3 , :g3 , :b3] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:fs3 , :a3 , :cs4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:a3 , :cs4 , :e4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:g3 , :b4 , :d4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:a3 , :cs4 , :e4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:fs3 , :a3 , :cs4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:a3 , :cs4 , :e4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
            play_chord [:g3 , :b4 , :d4] , release: 5, attack: 2, cutoff: 95 ,
              vibrato_depth: 0
            sleep 4
          end
          
        end
      end
    end
  end
end

define :pluck do
  
  use_synth :pluck
  
  with_fx :lpf , cutoff:120 , amp: 0.8 do
    with_fx :bitcrusher , amp: 0.5 do
      with_fx :reverb , mix: 0.8 , amp: 1 do
        sleep 16
        1.times do
          10.times do
            arpeggiator(chord(:e3, :minor), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:fs3, :minor7), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:a3, :major), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:g3, :major), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:a3, :major), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:fs3, :minor7), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:a3, :major), [2, 1, 0])
          end
          10.times do
            arpeggiator(chord(:g3, :major7), [2, 1, 0])
          end
        end
      end
    end
  end
end



define :distorted_pad do
  use_synth :prophet
  with_fx :hpf , cutoff: 90  , amp: 0.4 do
    with_fx :wobble do
      with_fx :lpf , cutoff: 100 do
        with_fx :reverb , room: 0.5 do
          with_fx :distortion, distort: 0.2 do
            with_fx :echo, phase: 0.75, decay: 3 , mix: 0.7  do
              with_fx :reverb, room: 0.9, mix: 0.6 do
                sleep 16
                play :e4, attack: 1, release: 6
                sleep 4
                play :fs4, attack: 2, release: 6
                sleep 4
                play :a4, attack: 2, release: 6
                sleep 4
                play :g4, attack: 2, release: 6
                sleep 4
                play :a4, attack: 2, release: 6
                sleep 4
                play :fs4, attack: 2, release: 6
                sleep 4
                play :a4, attack: 2, release: 6
                sleep 4
                play :g4, attack: 2, release: 6
                sleep 4
              end
            end
          end
        end
      end
    end
  end
end



define :rhodes do
  use_synth :piano
  with_fx :lpf , cutoff: 100 do
    with_fx :panslicer  , pulse_width: 0.25 , amp: 0.5 do
      with_fx :flanger   do
        with_fx :reverb, room: 0.7, mix: 0.5 do  # Add some reverb for warmth and space
          with_fx :distortion, distort: 0.1 do  # Slight distortion to mimic electric Rhodes overdrive
            with_fx :echo, depth: 1, mix: 0.7 , decay: 3 do  # Simulate the natural shimmer of the Rhodes
              sleep 32
              10.times do
                arpeggiator(chord(:e3, :minor), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:fs3, :minor7), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:a3, :major), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:g3, :major), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:a3, :major), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:fs3, :minor7), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:a3, :major), [2, 1, 0])
              end
              10.times do
                arpeggiator(chord(:g3, :major7), [2, 1, 0])
              end
            end
          end
        end
      end
    end
  end
end


define :bass do
  sync :tick
  with_fx :mono do
    with_fx :distortion , amp:2 do
      with_fx :krush , amp: 0.2 , cutoff: 70  do
        with_fx :lpf , cutoff:90 do
          use_synth :bass_foundation
          sleep 16
          play :e1 , release: 4 , attack: 0.3
          sleep 4
          play :fs1 , release: 4 , attack: 0.3
          sleep 4
          play :a1, release: 4 , attack: 0.3
          sleep 4
          play :g1 , release: 4 , attack: 0.3
          sleep 4
          play :e1 , release: 4 , attack: 0.3
          sleep 4
          play :fs1 , release: 4 , attack: 0.3
          sleep 4
          play :a1 , release: 4 , attack: 0.3
          sleep 4
          play :g1 , release: 4 , attack: 0.3
          sleep 4
        end
      end
    end
  end
end

##| #Drums

define :hi_hat do
  with_fx :flanger , depth: 0.5, feedback: 0.6 , amp: 0.4+0.25*Math.sin(vt * 0.5   * Math::PI) do
    sleep 16
    128.times do
      sample :drum_cymbal_closed, rate: 2  # rate of 2 raises pitch by an octav
      sleep 0.5
    end
  end
end

define :boom do
  with_fx :distortion , distort: 0.01 do
    sleep 16
    16.times do
      sample :bd_boom
      sleep 8
    end
  end
end

define :snare do
  sleep 32
  32.times do
    sleep 1
    sample :drum_snare_hard
    sleep 1
  end
end

define :snare2 do
  with_fx :reverb do
    sleep 32
    32.times do
      sleep 1.75
      sample :drum_snare_soft
      sleep 0.25
    end
  end
end

define :kick do
  sleep 32
  16.times do
    sample :drum_heavy_kick
    sleep 0.5
    sample :drum_heavy_kick
    sleep 7.5
    sample :drum_heavy_kick
    sleep 8
  end
end

#Pad
in_thread do
  pad
end

in_thread do
  pluck
end

in_thread do
  bass
end

in_thread do
  hi_hat
end

in_thread do
  snare
end

in_thread do
  snare2
end

in_thread do
  boom
end

in_thread do
  pad
end

in_thread do
  pluck
end

in_thread do
  rhodes
end

in_thread do
  pad
end

in_thread do
  pluck
end

in_thread do
  distorted_pad
end


