use_bpm 150

live_loop :drumsbass do
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_heavy_kick
  sleep 7.5
end

live_loop :drums2 do
  sleep 1
  sample :drum_snare_hard, amp: 0.5
  sleep 0.75
  sample :drum_snare_hard, amp: 0.5
  sleep 0.25
end

live_loop :drums3 do
  sample :drum_cymbal_closed, amp: 0.4
  sleep 0.5
  sample :drum_cymbal_closed, amp: 0.4
  sleep 0.5
  sample :drum_cymbal_closed, amp: 1
  sleep 0.5
  sample :drum_cymbal_closed, amp: 0.4
  sleep 0.5
end

live_loop :arpeggio do
  
  10.times do
    use_synth :piano
    play :d4, decay: 0.5
    sleep 0.5
    play :g3, decay: 0.5
    sleep 0.5
    play :e3, decay: 0.5
    sleep 0.5
  end
  cue :tick
  sync :bitir1
end

live_loop :arpeggio2 do
  sync :tick
  11. times do
    use_synth :piano
    play :e5, decay: 0.25
    sleep 0.5
    play :a4, decay: 0.25
    sleep 0.5
    play :fs4, decay: 0.25
    sleep 0.5
  end
  cue :baslat2
  cue :bitir2
end

live_loop :arpeggio3 do
  sync :baslat2
  11. times do
    use_synth :piano
    play :a5, decay: 0.25
    sleep 0.5
    play :cs5, decay: 0.25
    sleep 0.5
    play :a4, decay: 0.25
    sleep 0.5
  end
  cue :baslat3
  sync :bitir2
end

live_loop :arpeggio4 do
  sync :baslat3
  11. times do
    use_synth :piano
    play :fs5, decay: 0.25
    sleep 0.5
    play :b4, decay: 0.25
    sleep 0.5
    play :g4, decay: 0.25
    sleep 0.5
  end
  cue :bitir1
end

live_loop :bass do
  use_synth :organ_tonewheel
  play 40
  sleep 0.5
  play 40
  sleep 0.5
  play 43
  sleep 1
  play 50
  sleep 1
  play 52, decay: 13, decay_level: 0.25
  sleep 13
end

chords = [(chord :E, :minor7), (chord :Fs, :minor7), (chord :A, :major), (chord :G, :major7)].ring
c = chords[0]

live_loop :akor do
  use_synth :blade
  r = [0.25,0.25,0.25,0.25].choose
  play c.choose, amp: 0.6, release: r
  sleep r
end

live_loop :akor2 do
  use_synth :hoover
  r = [0.25,0.25,0.25,0.25].choose
  play c.choose, amp: 0.5, release: r
  sleep r
end


