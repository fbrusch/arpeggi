use_bpm 153

arpeggio1 = ([:d5,:g4,:e4].map {|x| [x,0.5,5]})*10
arpeggio2 = ([:e5,:a4,:fs4].map {|x| [x,0.5,5]})*11
arpeggio3 = ([:a5,:cs4,:a4].map {|x| [x,0.5,5]})*11
arpeggio4 = ([:g5,:b4,:g4].map {|x| [x,0.5,5]})*10 + ([:d5,:g4].map {|x| [x,0.5,5]})

arpeggio_pan1 = (([:e5, :g5, :e5].map {|x| [x,0.5,4,1]}) + ([:g5, :d5].map {|x| [x,0.5,4,1]}))*6 + ([:e5, :a5].map {|x| [x,0.5,4,1]})
arpeggio_pan2 = (([:e5, :d5, :b4].map {|x| [x,0.5,4,1]})+([:e5,:d5].map {|x| [x,0.5,4,1]}))*6
arpeggio_pan3 = (([:e5, :e5, :cs5].map {|x| [x,0.5,4,1]})+([:e5, :e5].map {|x| [x,0.5,4,1]}))*6 + ([:e5, :e5, :cs5].map {|x| [x,0.5,4,1]})
arpeggio_pan4 = (([:e5, :a5].map {|x| [x,0.5,4,1]})+([:e5, :a5, :e5].map {|x| [x,0.5,4,1]}))*6

$voce1 = ([[:d5,1,1 ],[:d5,0.5,0.5],[:d5,1,1],[:d5,1,1],[:d5,1,1],[:d5,11,1]])
$voce2 = ([[:b4,0.5,0.3],[:d5,1.5,1],[:d5,1,1],[:d5,0.5,0.5],[:d5,11,1]])
$voce3 = ([[:d5,1,1],[:cs5,15,1]])
$voce4 = ([[:b4,1,1],[:d5,2,1],[:d5,15,1]])

# Funzione play sequenza
def play_seq(seq)
  seq.each do |n|
    play n[0], amp: n[2], pan: n[3]
    sleep n[1]
  end
end

# Funzione suona arpeggio
define :arpeggios do
  use_synth :dark_ambience
  play_seq arpeggio1
  play_seq arpeggio2
  play_seq arpeggio3
  play_seq arpeggio4
end

define :panned_arp do
  use_synth :dark_ambience
  play_seq arpeggio_pan1
  play_seq arpeggio_pan2
  play_seq arpeggio_pan3
  play_seq arpeggio_pan4
end

# Topline
def topline
  with_fx :reverb, mix: 0.8 do
    use_synth :chiplead
    play_seq($voce1)
    play_seq($voce2)
    play_seq($voce3)
    play_seq($voce4)
  end
end

# Funzione suona accordi
def chords
  use_synth :organ_tonewheel
  with_fx :reverb, mix: 0.5 ,room: 0.5 do
    play chord(:e4, :m7),attack: 4, sustain: 4, release: 12
    sleep 16
    play chord(:fs4, :m7),attack: 4, sustain: 4,release: 12
    sleep 16
    play chord(:a4, :M), attack: 4, sustain: 4, release: 12
    sleep 16
    play chord(:g4, :M7) , attack: 4, sustain: 4, release: 12
    sleep 16
  end
end

def chords2
  use_synth :rhodey
  with_fx :echo, decay: 4, phase: 2 do
    play chord(:e4, :m7),attack: 4, sustain: 4, release: 12, amp: 0.2
    sleep 16
    play chord(:fs4, :m7),attack: 4, sustain: 4,release: 12, amp: 0.2
    sleep 16
    play chord(:a4, :M), attack: 4, sustain: 4, release: 12, amp: 0.2
    sleep 16
    play chord(:g4, :M7) , attack: 4, sustain: 4, release: 12, amp: 0.2
    sleep 16
  end
end

# Bass
def bass
  use_synth :bass_foundation
  play :e1, sustain: 0.8, amp: 0.5
  sleep 1
  play :a1, sustain: 0.8, amp: 0.5
  sleep 1
  play :d2, sustain: 0.8, amp: 0.5
  sleep 1
  play :e2 , sustain: 13, amp: 0.5
  sleep 12
  play :fs2, attack: 5, sustain: 12, amp: 0.5
  sleep 17
  play :a1 , sustain: 15, amp: 0.5
  sleep 15
  play :e2 , sustain: 0.3, amp: 0.3
  sleep 0.5
  play :fs2 , sustain: 0.3, amp: 0.5
  sleep 0.5
  play :g2 ,  sustain: 0.8,  amp: 0.4
  sleep 1
  play :fs2 ,  sustain: 0.8,  amp: 0.3
  sleep 1
  play :d2, sustain: 0.3, amp: 0.4
  sleep 1
  play :e2, sustain: 13.5, amp: 0.5
  sleep 13
end

# Batteria
def hihat
  16.times do
    sample :hat_star
    sleep 0.5
    sample :hat_star, amp: 0.5
    sleep 0.5
  end
end

def snare
  with_fx :reverb, room: 0.4 do
    8.times do
      sleep 1
      sample:elec_hi_snare, amp: rrand(0.6,1)
      sleep 0.75
      sample:elec_hi_snare, amp: rrand(0.2,0.4)
      sleep 0.25
    end
  end
end

def kick
  sample :drum_heavy_kick
  sleep 0.5
  sample :drum_heavy_kick
  sleep 7.5
  sample :drum_heavy_kick
  sleep 8
end

# Funzione batteria
def batteria
  in_thread do
    hihat
  end
  in_thread do
    snare
  end
  in_thread do
    kick
  end
end

# Intro
def intro
  4.times do
    sample :elec_pop
    sleep 1
  end
end

# Chiamo la intro
intro

sample :vinyl_hiss
batteria
sleep 16

# Parte la band
in_thread do
  8.times do
    batteria
    sleep 16
  end
end

in_thread do
  2.times do
    arpeggios
  end
end

in_thread do
  2.times do
    chords
  end
end

in_thread do
  sleep 48
  panned_arp
end

in_thread do
  2.times do
    bass
  end
end

in_thread do
  sleep 64
  topline
end

