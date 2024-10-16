use_bpm 153

# vars
$r1 = [:b, :fs, :d];
$r2 = [:a, :cs, :e];
$r3 = [:g, :b, :d];
$r4 = [:e, :g, :b];
$sleep_time = 0.5;

# definition of functions

def play_seq(seq)
  seq.each do |n|
    play seq
    sleep $sleep_time
  end
end

in_thread do :chords
  use_synth :beep
  loop do
    10.times do
      play_seq($r1);
    end
    11.times do
      play_seq($r2);
    end
    11.times do
      play_seq($r3);
    end
    10.times do
      play_seq($r4);
    end
  end
end

in_thread do :drums
  loop do
    'sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 1'
    sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 1
    sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 0.5
    sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 0.5
    sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 1
    sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 1
  end
end



