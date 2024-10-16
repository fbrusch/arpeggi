#weird fishes arpeggi radiohead
use_bpm 152
set :vol, 0.8

live_loop :closed_hats do
  sample :drum_cymbal_closed, amp: (get :vol)*2/3, pan: rrand(-0.2, 0.2), sustain: 0.3, release: 0.2
  sleep 0.25
  sample :drum_cymbal_closed, amp: (get :vol)/4, pan: rrand(-0.35, 0.35), sustain: 0.3, release: 0.2
  sleep 0.25
  sample :drum_cymbal_closed , amp: (get :vol)/2, pan: rrand(-0.2, 0.2), sustain: 0.3, release: 0.2
  sleep 0.5
  sample :drum_cymbal_closed , amp: (get :vol)/2, pan: rrand(-0.3, 0.3), sustain: 0.3, release: 0.2
  sleep 0.5
  cue :snare
  sample :drum_cymbal_closed , amp: (get :vol)/2, pan: rrand(-0.2, 0.2), sustain: 0.3, release: 0.2
  sleep 0.5
end

live_loop :snare do
  sync :snare
  sample :drum_snare_hard, amp: (get :vol)/2.3, release: 0.3, sustain: 0.2
  sleep 0.75
  sample :drum_snare_hard, amp: (get :vol)/6, pan: rrand(-0.3, 0.3), release: 0.3, sustain: 0.2
end

live_loop :kick do
  sample :drum_heavy_kick, amp: (get :vol)
  sleep 0.5
  sample :drum_heavy_kick, amp: (get :vol)*0.25
  sleep 2.5
  sample :drum_heavy_kick, amp: (get :vol)*0.75
  sleep 1
end

live_loop :open_hats do
  sleep 0.5
  sample :drum_cymbal_open, amp: (get :vol)*0.075, pan: rrand(-0.3, 0.3), release: 0.5, sustain: 0.5
  sleep 2
  sample :drum_cymbal_open, amp: (get :vol)*0.05, pan: rrand(-0.5, 0.5), release: 0.5, sustain: 0.5
  sleep 1.5
end

live_loop :cymbals do
  sample :drum_splash_soft, amp: (get :vol)*0.5, release: 0.5, sustain: 0.75, pan: rrand(-0.3, 0.3)
  sleep 31
  sample :drum_splash_soft, amp: (get :vol)*0.3, release: 0.5, pan: rrand(-0.5, 0.5)
  sleep 1
end

live_loop :snare_roll do
  sleep 31
  sample :drum_snare_hard, amp: (get :vol)/5, release: 0.3, sustain: 0.2, pan: -0.5
  sleep 0.5
  sample :drum_snare_hard, amp: (get :vol)/4, release: 0.3, sustain: 0.2, pan: 0.5
  sleep 0.5
end



in_thread do
  sleep 16
  live_loop :arpeggi do
    use_synth :piano
    use_synth_defaults amp: 0.8
    with_fx :reverb do
      with_fx :tremolo do
        8.times do
          play_pattern_timed [:e4, :d5, :g4], [0.5, 0.5, 0.5]
        end
        play_pattern_timed [:d5, :g4], [0.5, 0.5]
        play_pattern_timed [:fs4], [1]
        8.times do
          play_pattern_timed [:e5, :a4, :fs4], [0.5, 0.5, 0.5]
        end
        play_pattern_timed [:e5, :a4], [0.5, 0.5]
        play_pattern_timed [:a4], [1]
        4.times do
          play_pattern_timed [:a5, :cs4, :a4], [0.5, 0.5, 0.5]
        end
        4.times do
          play_pattern_timed [:g5, :cs4, :a4], [0.5, 0.5, 0.5]
        end
        play_pattern_timed [:a5, :cs4], [0.5, 0.5]
        play_pattern_timed [:g4], [1]
        8.times do
          play_pattern_timed [:fs5, :b4, :g4], [0.5, 0.5, 0.5]
        end
        play_pattern_timed [:fs5, :b4], [0.5, 0.5]
        play_pattern_timed [:e4], [1]
      end
    end
  end
end

in_thread do
  sleep 16
  live_loop :bassline do
    use_synth :bass_foundation
    use_synth_defaults amp: 0.8
    play_pattern_timed [:e2, :e2, :d3, :e3], [0.25, 0.5, 0.75, 0.5], sustain: 0.3
    play_pattern_timed [:e3], [8], sustain: 0.3, release: 2
    sleep 4
    play_pattern_timed [:fs2], [12], sustain: 2, release: 2
    sleep 2
    play_pattern_timed [:a2], [12], sustain: 2, release: 2
    sleep 2
    play_pattern_timed [:e2, :fs2, :g2, :fs2, :b2], [0.5, 0.5, 0.5, 0.5, 0.5]
    play_pattern_timed [:e3], [8]
    sleep 3.5
  end
end
