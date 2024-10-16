use_bpm 153

# vars
$r1 = [:b4, :fs4, :d4];
$r2 = [:a4, :cs4, :e4];
$r3 = [:g4, :b4, :d4];
$r4 = [:e4, :g4, :b4];
$sleep_time = 0.5;

$r12 = [:b3, :fs3, :d3];
$r22= [:a3, :cs3, :e3];
$r32 = [:g3, :b3, :d3];
$r42 = [:e3, :g3, :b3];

$amp = 0.8;

# definition of functions

def play_seq(seq, amp)
  seq.each do |n|
    play seq, amp: amp
    sleep $sleep_time
  end
end

def hi_hats()
  'sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
    sleep 1'
  sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
  sleep 0.5
  sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
  sleep 0.25
  sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
  sleep 0.25
  sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
  sleep 0.5
  sample :drum_cymbal_closed, rate: 1, amp: rand(1) * 0.5 + 0.5
  sleep 0.5
end

# Kick and snare pattern (basic groove)
def kick_snare()
  sample :drum_bass_soft, amp: 2, rate: 1
  sleep 1.5
  sample :drum_snare_soft, amp: 1.5
  sleep 1
  sample :drum_bass_soft, amp: 2, rate: 1
  sleep 0.5
  sample :drum_snare_soft, amp: 1.5
  sleep 1
end

#claps, beginning
4.times do
  sample :perc_snap, rate: 1, amp: 2
  sleep 1
end

in_thread do
  loop do
    8.times do
      hi_hats()
    end
    cue :drums
  end
end
in_thread do
  loop do
    8.times do
      kick_snare()
    end
  end
end

in_thread do :chords
  with_fx :echo do
    sync :drums
    use_synth :beep
    loop do
      10.times do
        play_seq($r1, $amp);
      end
      11.times do
        play_seq($r2, $amp);
      end
      11.times do
        play_seq($r3, $amp);
      end
      10.times do
        play_seq($r4, $amp);
      end
    end
  end
end

in_thread do :chords
  with_fx :slicer do
    sync :drums
    use_synth :beep
    loop do
      10.times do
        play_seq($r1, $amp/2);
      end
      11.times do
        play_seq($r2, $amp/2);
      end
      11.times do
        play_seq($r3, $amp/2);
      end
      10.times do
        play_seq($r4, $amp/2);
      end
    end
  end
end

in_thread do :chords
  sync :drums
  use_synth :beep
  loop do
    10.times do
      play_seq($r12, $amp);
    end
    11.times do
      play_seq($r22, $amp);
    end
    11.times do
      play_seq($r32, $amp);
    end
    10.times do
      play_seq($r42, $amp);
    end
  end
end











