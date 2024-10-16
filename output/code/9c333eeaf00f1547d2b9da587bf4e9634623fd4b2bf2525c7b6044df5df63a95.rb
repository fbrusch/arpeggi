use_bpm 130

#Made by:
#Jorge Cuartero 11056735
#Mattia Dalla Costa 11016188
#Nicola Nespoli 10766694
#Mateo Vitalone 11044548

#variables

arp1=[:e4, :g4, :d5]
arp2=[:fs4, :a4, :e5]
arp3=[:a4, :cs5, :a5]
arp4=[:g4, :b4, :fs5]
bass=[:e2,:fs2,:a2,:g2]

sequence=[arp1,arp2,arp3,arp4]

melody=[[:d4,5],[:g4,1],[:fs4,1],[:g4,1],[:a4,1.66],[:e4,3.34],[:e4,1],[:fs4,1],[:g4,1],[:g4,1.66],[:fs4,3.44],[:g4,1 ],[:fs4,1],[:e4,1],[:e4, 1.66],[:d4, 1]]

#functions

def play_melody(melody)
  with_fx :echo, phase: 0.1, decay: 2, amp: 0.2 do
    with_fx :reverb do
      melody.each do |x|
        play x[0], amp: 3
        sleep x[1]
      end
    end
  end
end

def pad(seq)
  with_fx :reverb , room: 1 do
    with_fx :lpf, cutoff: 65, res: 0.2 do
      cue :metronome
      use_synth :organ_tonewheel
      play seq[2], amp: 1.3, release: 2
      play seq[1], amp: 1.3, release: 2
      play seq[0], amp: 1.3, release: 2
    end
  end
end

def arpegio(seq)
  2.times do
    cue :metronome
    with_fx :reverb , room: 1 do
      with_fx :rhpf, cutoff: 70, res: 0.2 do
        use_synth :fm
        play seq[2], amp: rrand(0.1,0.4)
        sleep 0.66
        play seq[1], amp: rrand(0.1,0.4)
        sleep 0.33
        play seq[0], amp: rrand(0.1,0.4)
        sleep 0.55
        play seq[2], amp: rrand(0.1,0.4)
        sleep 1.45
        play seq[1], amp: rrand(0.1,0.4)
        sleep 0.66
        play seq[0], amp: rrand(0.1,0.4)
        sleep 0.34
      end
    end
  end
end

#loops

in_thread do
  3.times do
    sequence.each do |n|
      pad(n)
      arpegio(n)
    end
    cue :completeturn
  end
  cue :end
end

in_thread do
  loop do
    sync :metronome
    sample :bd_haus, amp: 1
    sleep 0.66
    sample :bd_haus, amp: 1
    sleep 0.34
    sample :drum_snare_soft, amp: 2
    sleep 0.66
    sample :bd_haus, amp: 1
    sleep 1.34
    sample :drum_snare_soft, amp: 2
  end
end

sync :metronome
7.times do
  sample :drum_cymbal_closed, amp: 0.6
  sleep 1
end
sample :drum_cymbal_closed, amp: 0.6


in_thread do
  loop do
    sync :metronome
    3.times do
      sample :drum_cymbal_closed, amp: 0.4
      sleep 0.66
      sample :drum_cymbal_closed, amp: 0.4
      sleep 0.34
    end
    hh_rate=rrand(0.8,1.2)
    sample :drum_cymbal_hard, amp: 1, rate: 0.7, sustain: 2 if one_in(6)
    sample :drum_cymbal_closed, amp: 0.4, rate: hh_rate
    sleep 0.33
    sample :drum_cymbal_closed, amp: 0.4, rate: hh_rate
    sleep 0.33
    sample :drum_cymbal_closed, amp: 0.4, rate: hh_rate
  end
end

sync :completeturn

in_thread do
  loop do
    play_melody(melody)
    sync :completeturn
  end
end

in_thread do
  loop do
    amp_bass = 2
    use_synth :beep
    bass.each do |i|
      2.times do
        play i, release: 4
        sleep 4
      end
      sync :metronome
    end
  end
end

sync :end

in_thread do
  play_melody(melody)
  sync :completeturn
end
