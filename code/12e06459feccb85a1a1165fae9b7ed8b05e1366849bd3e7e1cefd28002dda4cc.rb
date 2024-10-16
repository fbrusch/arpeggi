#2 minutes long

use_bpm 65
chords1 = [ chord(:e3, :minor7), chord(:fs3, :minor7), chord(:a3, :major), chord(:g2, :major7)]
chordsOut = [chord(:b3, :minor), chord(:C3, :major), chord(:b3, :minor), chord(:a3, :major), chord(:g2, :major7)]
bassSeq = [:e4, :fs4, :a4, :g4]
melody2 = [:e4, :e4, :fs4, :g4, :a4, :d5, :e5, :d5, :cs5, :b4]
melodyOut = [:b4, :b4, :g5, :e5, :c5, :b4, :b4, :e5, :c5, :a4, :a4, :b4]


#funcion that plays the arpeggio base
def play_arpeggio(seq)
  seq.each do |n|
    if n.size() == 4
      4.times do
        play_pattern_timed n, 0.25, amp: 0.3
      end
    else
      4.times do
        play_pattern_timed n, 0.3333333, amp: 0.3 #if i put 1/3 the sound is corrupted
      end
    end
  end
end

#funcion that plays the sequence of repeated notes
def play_seq (seq)
  seq.each do |n|
    play n, release: 3.5, amp: 0.5
    sleep 4
  end
end



#sequence
in_thread do
  sleep 16
  4.times do
    with_fx :reverb do
      use_synth :chiplead
      with_fx :ping_pong do
        with_fx :slicer do
          play_seq bassSeq
        end
      end
    end
  end
end

#melody
in_thread do
  sleep 32
  use_synth :dsaw
  2.times do
    with_fx :wobble do
      play_pattern_timed melody2, [3, 0.33, 0.33, 0.34, 4, 3, 0.33, 0.33, 0.34, 4], amp: 0.5, release: 1
    end
  end
  sleep 16
  2.times do
    with_fx :wobble do
      play_pattern_timed melodyOut, [3, 0.33, 0.33, 0.34, 4, 3, 0.33, 0.33, 0.34, 2, 2, 4], amp: 0.5, release: 1
    end
  end
end

#arpeggios
in_thread do
  use_synth :chipbass
  5.times do
    play_arpeggio chords1
  end
  2.times do
    play_arpeggio chordsOut
  end
end

#blow sound
in_thread do
  31.times do
    sample :elec_filt_snare , rate: 0.2, amp: 2
    sleep 4
  end
end

#drums
in_thread do
  sleep 16
  27.times do
    sleep 1
    sample :drum_snare_soft
    sleep 1
    sample :bd_ada
    sleep 1
    sample :drum_snare_soft
    sleep 1
  end
end










