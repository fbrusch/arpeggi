#weird fishes

use_bpm 150

fb1 = [:d6,:g5,:e5]. map do |x| [x, 0.5] end
fb2 = [:e6,:a5,:fs5]. map do |x| [x, 0.5] end
fb3 = [:a6,:cs6,:a5]. map do |x| [x, 0.5] end
fb4 = [:fs6,:b5,:g5]. map do |x| [x, 0.5] end

$a1 = [:e6,:g6,:d6,:e6,:g6]. map do |x| [x, 0.5] end
$a2 = [:e6,:d6,:b5,:e6,:d6]. map do |x| [x, 0.5] end
$a3 = [:e6,:e6,:cs6,:e6,:e6]. map do |x| [x, 0.5] end
$a4 = [:e6,:a6,:e6,:e6,:a6]. map do |x| [x, 0.5] end

$b1 = [:e6,:g6,:b6,:e6,:g6]. map do |x| [x, 0.5] end
$b2 = [:fs6,:a6,:cs7,:fs6,:a6]. map do |x| [x, 0.5] end
$b3 = [:g6,:b6,:d7,:g6,:b6]. map do |x| [x, 0.5] end

set :b, 0.5

in_thread do
  loop do
    cue :drum
    sample :drum_heavy_kick
    sleep (get :b)
    sample :hat_cab
    sleep (get :b)/2
    sample :hat_bdu
    sleep (get :b)/2
  end
end


in_thread do
  loop do
    sync :drum
    sample :drum_snare_soft
    sleep 0.5
    sample :drum_snare_soft, amp: 0.8
    sleep ((get :b)*2 - 0.5)
  end
end


in_thread do
  sync :drum
  loop do
    sample :drum_cymbal_soft, amp: 0.5
    sleep (get :b)*4
  end
end


in_thread do
  use_synth :bass_foundation
  sync :base
  with_fx :lpf do
    loop do
      play (64 - 36)
      sleep 0.5
      play (64 - 36)
      sleep 0.5
      play (64 + 3 - 36)
      sleep 1
      play (62 - 24 )
      sleep 1
      play (62 - 24 +2)
      sleep 1+(4*3)
      
      
      play (64 - 36 + 2)
      sleep 16
      
      
      play (64 - 36 + 5)
      sleep 15
      play (64 -36 + 2)
      sleep 0.5
      play (64 -36 + 2)
      sleep 0.5
      
      
      play (64 - 36 + 3)
      sleep 1
      play (64 -36 + 2)
      sleep 1
      play (64 - 36)
      sleep 1
      play  (62 -24 + 2)
      sleep 1+ 4*3
    end
  end
end


def play_seq(seq)
  seq.each do |n|
    play n[0]
    sleep n[1]
  end
end

in_thread do
  sleep 5
  loop do
    sync :drum
    cue :base
    with_fx :slicer do
      with_fx :ping_pong, mix: 0.5 do
        use_synth :piano
        play_seq fb1*10
        play_seq fb2*11
        play_seq fb3*11
        play_seq fb4*10
        play :d6
        sleep get :b
        play :g5
        sleep get :b
      end
    end
  end
end


def second_g
  play_seq $a1*6
  play_seq $a2*6
  play_seq $a3*7
  play_seq $a4*6
  play :a6
  sleep get :b
end


def third_g
  play_seq $b1*6
  play_seq $b2*13
  play_seq $b3*6
  play :g6
  sleep get :b
end


in_thread do
  sleep 64 + 5
  3.times do
    with_fx :reverb do
      use_synth :pluck
      second_g
    end
  end
end

in_thread do
  sleep 128 + 5
  2.times do
    with_fx :reverb do
      use_synth :bass_foundation
      third_g
    end
  end
end



