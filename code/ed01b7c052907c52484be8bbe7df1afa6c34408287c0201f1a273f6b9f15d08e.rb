#BPM
$bpm = 60.0/150.0
$bar_count = 0


#Create bars and beats signals
in_thread do
  loop do
    cue :bar
    $bar_count += 1
    4.times do
      cue :beat
      sleep $bpm
    end
  end
end

#Cymbals
in_thread do
  with_fx :reverb do
    loop do
      sync :beat
      sample :drum_cymbal_closed
    end
  end
end


#Kick & snare
in_thread do
  with_fx :reverb do
    loop do
      sync :bar
      sample :drum_heavy_kick
      sleep $bpm
      sample :drum_snare_hard
      sleep $bpm*3.0/4.0
      sample :drum_snare_soft
      sleep $bpm/2.0
      sample :drum_snare_soft
      sleep $bpm/4.0
      sample :drum_heavy_kick
      sleep $bpm/2.0
      sample :drum_snare_hard
    end
  end
end


#Melody variation
in_thread do
  sync :bar
  loop do
    $seq = [:d5, :g4, :e4]
    $chord1 = [:e4, :g4, :b4]
    sleep $bpm*4*4
    $seq = [:e5, :a4, :fs4]
    $chord1 = [:e4, :g4, :a4]
    sleep $bpm*4*4
  end
end


#Main arp
live_loop :arp do
  sync :bar
  if $bar_count >= 8
    use_synth :piano
    with_fx :reverb do
      loop do
        $seq.each do |nota|
          play nota, amp: 0.5, release: 0.8
          sleep $bpm/2.0
        end
      end
    end
  end
end




#Bass
in_thread do
  loop do
    sync :bar
    if $bar_count >= 4
      7.times do
        use_synth :bass_foundation
        play :e1, attack: 0, release: 0.3
        sleep $bpm/2.0
      end
      play :e1, attack: 0, release: 0.3
    end
  end
end


#Pad
in_thread do
  loop do
    sync :bar
    if $bar_count >= 16
      use_synth :saw
      $chord1.each do |nota|
        with_fx :flanger do
          play nota, attack: 1, release: 2, amp: 0.2
        end
        sleep $bpm
      end
    end
  end
end



