Emin = [:d4, :g3, :e3, :d4,:g3, :e3, :d4, :g3 ]
FsMin = [:fs3,:e4, :a4, :fs3, :e4, :a4, :fs3, :e4 ]
A = [:cs5, :a5, :a6, :cs5, :a5, :a6, :cs5, :a5]
Em9 = [:fs5, :b5, :g4, :fs5, :b5, :g4, :fs5, :b5]
cho=[Emin, FsMin, A, Em9]
set :o,  1.5
def drum
  sample :bd_haus
  sleep 0.5
  sample :bd_zum
  sleep 0.5
  sample :hat_bdu
  sleep 0.5
  sample :hat_bdu
  sample :bd_haus
  sleep 0.25
end

def f1
  Emin.each do |nota|
    
    play nota
    sleep 0.5
    
    
  end
end
def f2
  FsMin.each do |nota|
    
    play nota
    sleep 0.5
    
  end
end
def f3
  A.each do |nota|
    
    play nota
    sleep 0.5
    
  end
  
end
def f4 (dur)
  Em9.each do |nota|
    
    play nota
    sleep dur
  end
end

4.times do
  f4 (get :o)
  set :o, (get :o) - 0.25
end
set :o, 0.25
4.times do
  cue :durm
  sample :bd_haus
  f4( get :o)
end

sleep 1

1.times do
  f4(1)
  
end
live_loop :melody do
  use_synth :dpulse
  4.times do
    cue :drum
    cue :init
    f1
  end
  4.times do
    cue :drum
    cue :sec
    f2
  end
  4.times do
    cue :drum
    cue :tri
    f3
  end
  4.times do
    cue :drum
    cue :quad
    f4(0.5)
  end
  stop
end
live_loop :drum do
  sync :drum
  10.times do
    drum
  end
  
end

with_fx :reverb do
  with_fx :level, amp: 1.7 do
    
    live_loop :down do
      use_synth :hollow
      sync :init
      [:e4, :g4, :e4].each do |nota|
        play nota ,release: 3, amp: 2.5 , attack_level: 3
        sleep 1
        
      end
    end
    
    live_loop :sos do
      sync :sec
      use_synth :hollow
      [:e4, :a4, :e4].each do |nota|
        play nota ,release: 3, amp: 2.5, attack_level: 3
        sleep 1
      end
      
    end
    
    live_loop :tre do
      sync :tri
      use_synth :hollow
      
      
      [:cs4, :a4, :cs5].each do |nota|
        play nota ,release: 3, amp: 2.5, attack_level: 3
        sleep 1
      end
    end
    live_loop :quad do
      sync :quad
      use_synth :hollow
      
      
      [:fs3, :a4, :fs4].each do |nota|
        play nota ,release: 3, amp: 2.5, attack_level: 3
        sleep 1
      end
    end
  end
end
with_fx :flanger , decay: 1  do
  with_fx :eq , high: 1.2 do
    with_fx :level, amp: 0.2 do
      live_loop :bass do
        use_synth :supersaw
        
        sync :init
        play :e2, release: 7
      end
      live_loop :bass2 do
        use_synth :supersaw
        
        sync :sec
        play :fs2, release: 7
      end
      live_loop :bass3 do
        use_synth :supersaw
        
        sync :tri
        play :a2, release: 7
      end
      live_loop :bass4 do
        use_synth :supersaw
        
        sync :quad
        play :e2, release: 7
      end
    end
  end
end






