use_bpm 153

# Metronome loop
live_loop :met1 do
  cue :met1
  sleep 2
end

# Drum loop syncing to metronome
live_loop :rides do
  sync :met1
  sample :drum_bass_hard, amp: 0.2, release: 0.1
  sleep 1
  
end

# Define named arpeggios
a = [[:d4, 1.8], [:g3, 1.2], [:e3, 1]]
b = [[:e4, 1.8], [:a3, 1.2], [:fs3, 1]]
c = [[:a4, 1.8], [:cs4, 1.2], [:a3, 1]]
d = [[:fs4, 1.8], [:b3, 1.2], [:g3, 1]]
e = [[:g4, 1.8], [:cs4, 1.2], [:a3, 1]]
f = [[:fs4, 1.8], [:cs4, 1.2], [:a3, 1]]
g = [[:fs4, 1.8], [:cs4, 1.2], [:b3, 1]]

# Helper function to play an arpeggio n times
define :play_arp do |arp, times|
  times.times do
    arp.each do |note|
      use_synth :blade
      play note[0], cutoff: 90, amp: note[1]
      sleep 0.5
    end
  end
end

# Arpeggio loop syncing to metronome
live_loop :arpeggi do
  sync :met1
  play_arp(a, 10)
  play_arp(b, 11)
  play_arp(c, 11)
  play_arp(d, 10)
  play_arp(a, 11)
  play_arp(b, 11)
  play_arp(c, 5)
  play_arp(e, 3)
  play_arp(f, 1)
  play_arp(g, 1)
end

# Strings loop syncing to metronome
live_loop :strings do
  sync :met1
  use_synth :rhodey
  
  play :d2, amp: 0.1
  
  
end


define :rslice  do
  sync :met1
  direction = 1
  sample :loop_amen, beat_stretch: 4, rate: direction
  sleep 4
  sample :loop_amen, beat_stretch: 4,  start: 0.5, finish: 1, rate: direction # Suona un frammento al contrario
  sleep 2
  sample :loop_amen, beat_stretch: 4,  start: 0.5, finish: 1, rate: direction  # Suona un frammento al contrario
  sleep 2
  sample :loop_amen, beat_stretch: 4,  start: 0.5, finish: 1, rate: direction  # Suona un frammento al contrario
  sleep 2
  sample :loop_amen, beat_stretch: 4,  start: 0.5, finish: 1, rate: direction  # Suona un frammento al contrario
  sleep 2
  sample :loop_amen, beat_stretch: 4,  start: 0.5, finish: 1, rate: direction  # Suona un frammento al contrario
  sleep 2
  sample :loop_amen, beat_stretch: 4,  start: 0.5, finish: 1, rate: direction  # Suona un frammento al contrario
end

sleep 16
live_loop :random_synth_d4 do
  
  synths = [:saw, :prophet, :blade, :fm, :tb303, :subpulse, :dark_ambience, :hoover]
  
  
  use_synth synths.choose
  
  play :d4, release: 0.8
  
  sleep 1
end


sleep 32
live_loop :rides do
  sync :met1
  sample :drum_bass_hard, amp: 0.2, release: 0.1
  
  sleep 1
  sample :drum_cymbal_open, amp: 0.2, release: 0.1
end
live_loop :drums do
  rslice
end