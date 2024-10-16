#this was intended as live performance, I will add screen capture version next friday.
use_bpm = 150

def play_seq(seq, sc, sy)
  scale_notes = scale(:d4, sc).to_a
  
  seq.each do |n|
    use_synth sy
    play scale_notes[n[0]]
    sleep n[1]
  end
end

fm1 = ([0, 3, 1].map { |i| [i, 0.5] }) * 10

fm2 = ([1,4,2].map { |i| [i, 0.5] })*10

fm2 << [1,0.5] <<[4,0.5]


fm3 =  ([4, 6, 4].map { |i| [i, 0.5] } * 11)
fm3.unshift([6, 0.5]) #add to front

fm4 = ([2,5, 3].map { |i| [i, 0.5] }) *10





live_loop :hi_hat do
  sample :drum_cymbal_closed, amp: 0.6
  sleep 0.5
end

live_loop :kick do
  sample :bd_tek, amp: 0.75
  sleep 0.5
  sample :bd_tek, amp: 0.75
  sleep 7.5
  sample :bd_tek, amp: 0.75
  sleep 8
  cue 'play'
end


live_loop :snare do
  sleep 1
  sample :drum_snare_hard, amp: 1
  sleep 0.75
  sample :drum_snare_hard, amp: 1
  sleep 0.25
end


live_loop :melody do
  sync 'play'
  play_seq fm1, :major, :piano
  play_seq fm2, :major, :piano
  play_seq fm3, :major, :piano
  play_seq fm4, :major, :piano
end


live_loop :bass do
  sync 'play'
  synth :bass_foundation, sustain: 15, amp: 0.1
  play :e3, release: 10,amp: 0.2
  sleep 15
  play :fs3, release: 10,amp: 0.2
  sleep 16
  play :a3, release: 10,amp: 0.2
  sleep 16.5
  play :e2, release: 10,amp: 0.2
  sleep 15.5
end