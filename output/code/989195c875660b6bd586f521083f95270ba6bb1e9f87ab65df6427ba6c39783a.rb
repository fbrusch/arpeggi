use_bpm 150

set :b, 4.0

in_thread do
  loop do
    sample :hat_bdu, amp: 0.9
    sleep (get :b)/8
  end
end

in_thread do
  loop do
    sample :bd_tek, amp: 3
    sleep (get :b)/8
    sample :bd_tek
    sleep (get :b)/8*7
    sample :bd_tek, amp: 2
    sleep (get :b)
  end
end

in_thread do
  loop do
    sleep (get :b)/4
    sample :drum_snare_hard, amp: 1.2
    sleep (get :b)/16*3
    sample :drum_snare_soft, amp: 0.8
    sleep (get :b)/16*1
  end
end

in_thread do
  loop do
    use_synth :tech_saws
    sleep (get :b)*16
    play 50, decay: 8, decay_level: 0, attack: 8, sustain: 20, sustain_level: 1
      end
end


in_thread do
  use_synth :mod_fm
  sync :tick1
  play 50, decay: 5, decay_level: 0, attack: 8,  sustain_level: 1
  sync :tick2
  play 52, decay: 5, decay_level: 0, attack: 8,  sustain_level: 1
  sync :tick3
  play 57, decay: 5, decay_level: 0, attack: 8,  sustain_level: 1
  sync :tick4
  play 54, decay: 5, decay_level: 0, attack: 8,  sustain_level: 1
  
end


define :arp1lo do
  use_synth :dtri
  play 62, release: 2
  sleep (get :b)/8
  play 55
  sleep (get :b)/8
  play 52
  sleep (get :b)/8
end

define :arp2lo do
  use_synth :dtri
  play 64, release: 2
  sleep (get :b)/8
  play 57
  sleep (get :b)/8
  play 54
  sleep (get :b)/8
end

define :arp3lo do
  use_synth :dtri
  play 69, release: 2
  sleep (get :b)/8
  play 61
  sleep (get :b)/8
  play 57
  sleep (get :b)/8
end

define :arp4lo do
  use_synth :dtri
  play 66, release: 2#
  sleep (get :b)/8
  play 59
  sleep (get :b)/8
  #play 62
  play 55
  sleep (get :b)/8
end

define :arp1hi do
  use_synth :dtri
  play 74, release: 2
  sleep (get :b)/8
  play 67
  sleep (get :b)/8
  play 64
  sleep (get :b)/8
end

define :arp2hi do
  use_synth :dtri
  play 76, release: 2
  sleep (get :b)/8
  play 69
  sleep (get :b)/8
  play 66
  sleep (get :b)/8
end

define :arp3hi do
  use_synth :dtri
  play 81, release: 2
  sleep (get :b)/8
  play 73
  sleep (get :b)/8
  play 69
  sleep (get :b)/8
end

define :arp4hi do
  use_synth :dtri
  play 78, release: 2
  sleep (get :b)/8
  play 71
  sleep (get :b)/8
  #play 62
  play 67
  sleep (get :b)/8
end

in_thread do
  loop do
    cue :tick1
    10.times do
      arp1lo
    end
    cue :tick2
    10.times do
      arp2lo
    end
    cue :tick3
    10.times do
      arp3lo
    end
    cue :tick4
    10.times do
      arp4lo
    end
    
    cue :tick5
    5.times do
      arp1lo
      arp1hi
    end
    cue :tick6
    5.times do
      arp2lo
      arp2hi
    end
    cue :tick7
    5.times do
      arp3lo
      arp3hi
    end
    cue :tick8
    5.times do
      arp4lo
      arp4hi
    end
    
    10.times do
      
      arp1hi
    end
    10.times do
      arp2hi
    end
    10.times do
      arp3hi
    end
    10.times do
      arp4hi
    end
  end
  
end





