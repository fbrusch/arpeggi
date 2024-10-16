def play_seq1(seq)
  seq.each do |n|
    play n[0], amp: 5
    sleep n[1]
  end
end

def play_seq(seq)
  seq.each do |n|
    play n[0]
    sleep n[1]
  end
end

a1=[ :d5, :g4, :e4].map {|x| [x,0.25]}
a2=[ :e5, :a4, 66].map {|x| [x,0.25]}
a3=[ :a5, 73, :a4].map {|x| [x,0.25]}
a4=[ 78, :b4, :g4].map {|x| [x,0.25]}

b1=[ :g5, :e5, :d5, :g5, :d5].map {|x| [x, 0.25]}
b2=[ :g4, :d5, :e5, :g4, :d5].map {|x| [x, 0.25]}
b3=[ :a4, :e5, 78, :a4, :e5].map {|x| [x, 0.25]}
b4=[ 73, :e5, :a5, 73, :e5].map {|x| [x, 0.25]}

in_thread do
  sleep 16
  loop do
    use_synth :dark_ambience
    10.times do
      play_seq1 a1
    end
    11.times do
      play_seq1 a2
    end
    11.times do
      play_seq1 a3
    end
    10.times do
      play_seq1 a4
    end
  end
end

in_thread do
  sleep 32
  loop do
    use_synth :blade
    6.times do
      play_seq b1
    end
    play :g5
    sleep 0.25
    play :d5
    sleep 0.25
    6.times do
      play_seq b2
    end
    play :g4
    sleep 0.25
    play :d5
    sleep 0.25
    6.times do
      play_seq b3
    end
    play :a4
    sleep 0.25
    play :e5
    sleep 0.25
    6.times do
      play_seq b4
    end
    play 73
    sleep 0.25
    play :e5
    sleep 0.25
  end
end

in_thread do
  loop do
    cue :bass
    use_synth :bass_highend
    play :E2, amp: 0.5, release: 1
    sleep 1
    play :D2, amp: 0.5, release: 1
    sleep 1
    play :a2, amp: 0.5, release: 1
    sleep 1
    play :b2, amp: 0.5, release: 1
    sleep 1
  end
end

in_thread do
  sleep 32
  loop do
    sample :ambi_choir, release: 4, amp: 3
    sleep 4
    sample :ambi_choir, release: 4, amp: 3, pitch: -2
    sleep 4
    sample :ambi_choir, release: 4, amp: 3, pitch: 5
    sleep 4
    sample :ambi_choir, release: 4, amp: 3, pitch: 7
    sleep 4
  end
end

in_thread do
  sleep 8
  loop do
    2.times do
      sample :drum_cymbal_closed, release: 0.1
      sleep 0.25
    end
    sleep 0.25
    sample :drum_cymbal_closed, release: 0.1
    sleep 0.25
  end
end

in_thread do
  sleep 4
  loop do
    sync :bass
    use_synth :bass_foundation
    play :e2
    sleep 0.25
  end
end

in_thread do
  sleep 16
  loop do
    sleep 0.25
    sample :drum_tom_mid_hard, release: 0.1
    sleep 0.25
    sample :drum_tom_mid_hard, release: 0.1
    sleep 0.75
    sample :drum_tom_mid_hard, release: 0.1
  end
end


