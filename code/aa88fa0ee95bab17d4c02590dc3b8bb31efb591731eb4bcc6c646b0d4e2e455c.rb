# WEIRD FISHES - 11/10/2024

# GROUP COMPOSED BY
# IPEK CEREN BAYRAM
# GIANLUIGI VECCHINI
# FEDERICO CAPITANI
# MICHELE ZANARDI


###############################


#GUITAR

Em7 = [:d4, :g3, :e3]
Fsm7 = [:e4, :a3, :fs3]
A = [:a4, :e3, :a3]
A7 = [:g4, :e3, :a3]
A6 = [:fs4, :e3, :a3]
Gmaj7 = [:fs4, :b3, :g3]

def play_arp(arp)
  arp.each do |n|
    use_synth :pluck
    with_fx :reverb, mix: 0.6, room: 0.75 do
      play n, attack: 0.01, release: 0.5
    end
    sleep 0.25
  end
end

def guitar_verse_1
  10.times do
    play_arp(Em7)
  end
  
  11.times do
    play_arp(Fsm7)
  end
  
  11.times do
    play_arp(A)
  end
  
  10.times do
    play_arp(Gmaj7)
  end
end

def guitar_verse_2
  
  10.times do
    play_arp(Em7)
  end
  
  11.times do
    play_arp(Fsm7)
  end
  
  6.times do
    play_arp(A)
  end
  
  3.times do
    play_arp(A7)
  end
  
  2.times do
    play_arp(A6)
  end
  
  10.times do
    play_arp(Gmaj7)
  end
end

#DRUMS

def kick
  sample :drum_bass_soft
  sleep 0.25
  sample :drum_bass_hard
  sleep 1.75
  sample :drum_bass_hard
  sleep 2
end

def snare
  sleep 0.5
  sample :drum_snare_soft
  sleep 0.375
  sample :drum_snare_soft
  sleep 0.625
  sample :drum_snare_soft
  sleep 0.375
  sample :drum_snare_soft
  sleep 0.625
  sample :drum_snare_soft
  sleep 0.375
  sample :drum_snare_soft
  sleep 0.625
  sample :drum_snare_soft
  sleep 0.5
end

def hi_hat
  16.times do
    sample :hat_cab, amp: 0.5
    sleep 0.25
  end
end

def ride
  16.times do
    sample :drum_cymbal_soft
    sleep 0.25
  end
end

def drum_pattern_verse_1
  in_thread do
    play kick
  end
  
  in_thread do
    play snare
  end
  
  in_thread do
    play hi_hat
  end
  sleep 4
end

def drum_pattern_verse_2
  4.times do
    in_thread do
      play kick
    end
    
    in_thread do
      play snare
    end
    
    in_thread do
      play ride
    end
    sleep 2
  end
end


def beginningdrum
  4.times do
    sample :hat_bdu
    sleep 0.5
  end
end

#BASS

def bass (n, l, r, a)
  use_synth :sine
  play n, amp: 1.3-a, sustain: l, release: r
  play n+12, amp: 0.2, sustain: l, release: r
  play n+24, amp: 0.05, sustain: l, release: r
  use_synth :tri
  play n, amp: 1.3-a, sustain: l, release: r
end

def bass_pattern_1
  2.times do
    bass(:e1, 0.2, 0.1, 0)
    sleep 0.25
  end
  bass(:a1, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:d2, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:e2, 5, 4.5, 0.2)
  
  sleep 6.5
  
  bass(:fs1, 7, 6.5, 0.2)
  
  sleep 8
  
  bass(:a1, 6, 5.5, 0.2)
  
  sleep 7.5
  
  bass(:e1, 0.2, 0.1, 0.2)
  sleep 0.25
  bass(:fs1, 0.2, 0.1, 0.2)
  sleep 0.25
  bass(:g1, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:fs1, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:e1, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:e2, 5, 4.5, 0.1)
  
  sleep 6.5
end


def bass_pattern_2
  2.times do
    bass(:e1, 0.2, 0.1, 0)
    sleep 0.25
  end
  
  bass(:a1, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:d2, 0.5, 0.1, 0.2)
  sleep 0.5
  bass(:e2, 5, 4.5, 0.2)
  
  sleep 6.5
  
  bass(:fs1, 7, 6.5, 0.2)
  
  sleep 8
  
  bass(:a1, 7, 6.5, 0.2)
  
  sleep 8
  
  bass(:a1, 0.2, 0.1, 0)
  sleep 0.25
  bass(:b1, 0.2, 0.1, 0)
  sleep 0.25
  bass(:g1, 1.5, 1.25, 0.1)
  sleep 3.25
  bass(:fs1, 0.2, 0.1, 0)
  sleep 0.25
  bass(:g1, 1.5, 1, 0.1)
  sleep 3.5
  bass(:g1, 0.5, 0.1, 0.1)
  sleep 0.5
end






#SECOND GUITAR

secEm7 = [:e5, :g5, :d5]
secBm4 = [:e5, :d5, :b4]
secFdiesism7 = [:e6, :e5, :cs5]
secEm4 = [:a5, :e6, :e5]

$notecasual = [secEm7, secBm4, secFdiesism7, secEm4]

def second_guitar
  $notecasual.each do |acc|
    use_synth :fm
    with_fx :pan, pan: -1 do
      with_fx :reverb, amp: 0.5, mix: 1, dry: 0.5 do
        (4*8).times do
          play acc.sample, pan: -1
          sleep 0.25
        end
      end
    end
  end
end





#SONG


beginningdrum

2.times do
  drum_pattern_verse_1
end


t1 = in_thread do
  8.times do
    drum_pattern_verse_1
  end
end

t2= in_thread do
  guitar_verse_1
end

t7 = in_thread do
  bass_pattern_1
end

sleep 32

t3 = in_thread do
  8.times do
    drum_pattern_verse_1
  end
end

t4 = in_thread do
  guitar_verse_2
end

t8 = in_thread do
  bass_pattern_2
end

sleep 32

t5 = in_thread do
  guitar_verse_1
end

t6 = in_thread do
  second_guitar
end

t9 = in_thread do
  bass_pattern_1
end
