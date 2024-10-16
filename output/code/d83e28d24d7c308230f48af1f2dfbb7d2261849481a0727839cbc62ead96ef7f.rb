# Weird Fishes / Arpeggi

# Marco Porcella
# Giacomo De Toni
# Filippo Longhi
# Andrea Crisafulli

set_link_bpm! 77 # Sets BPM to correct value for the song


arp1 = [:D4,:G3,:E3] #10 volte
arp2 = [:E4,:A3,:Fs3] #10 volte
br1 = [:E4,:A3,:Cs4]
arp3 = [:A4,:Cs4,:A3] #11 volte
arp4 = [:Fs4,:B3,:G3] #10 volte
br2 = [:D4,:G3]

# - Intro ---------------------------------------------------------------
4.times do
  sample :perc_snap
  sleep 0.5
end

# - Hi hat ---------------------------------------------------------------
in_thread do
  loop do
    sample :drum_cymbal_closed, amp: 1
    sleep 0.25
    sample :drum_cymbal_closed, amp: 0.5
    sleep 0.25
  end
end

# - Snare -------------------------------
in_thread do
  loop do
    sleep 0.5
    sample :drum_snare_hard, amp: 1
    sleep 0.375
    sample :drum_snare_hard, amp: 0.5
    sleep 0.125
  end
end

# - Bass drum ----------------------------
in_thread do
  loop do
    sample :drum_bass_soft
    sleep 0.25
    sample :drum_bass_soft
    sleep 3.75
    sample :drum_bass_soft
    sleep 4
  end
end


key_bass = scale(:e2, :chromatic, num_octaves: 2)

bass_notes = [[0, 5, 10, 12],
              [2, 5],
              [0, 2],
              [3, 2, 0]]

# Function to play the bass
define :play_bass do |bass_notes|
  with_fx :compressor do
    with_fx :lpf do
      use_synth :bass_foundation
      bass_notes[0].each do |nota|
        play key_bass[nota], release: 5, attack_level: 0.7
        sleep 0.5
      end
      
      sleep 6
      
      
      play key_bass[bass_notes[1][0]], release: 5, attack_level: 0.7
      sleep 8
      play key_bass[bass_notes[1][1]], release: 5, attack_level: 0.7
      sleep 7.5
      
      bass_notes[2].each do |nota|
        play key_bass[nota], release: 5, attack_level: 0.7
        sleep 0.25
      end
      
      bass_notes[3].each do |nota|
        play key_bass[nota], release: 5, attack_level: 0.7
        sleep 0.5
      end
      
      sleep 6
    end
  end
end

# - Bass ---------------------------------------------------------
in_thread do
  sleep 8
  loop do
    play_bass bass_notes
  end
end

# - Guitar arpeggio ----------------------------------------------
in_thread do
  sleep 8
  loop do
    use_synth :pluck
    10.times do
      play_pattern_timed arp1, 0.25, amp: 2, sustain: 0.225
    end
    
    10.times do
      play_pattern_timed arp2, 0.25, amp: 2, sustain: 0.225
    end
    
    play_pattern_timed br1, 0.25, amp: 2, sustain: 0.225
    
    11.times do
      play_pattern_timed arp3, 0.25, amp: 2, sustain: 0.225
    end
    
    10.times do
      play_pattern_timed arp4, 0.25, amp: 2, sustain: 0.225
    end
    
    play_pattern_timed br2, 0.25, amp: 2, sustain: 0.225
  end
end

# And so on...

