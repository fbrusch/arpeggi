# Welcome to Sonic Pi
use_bpm 77
slp_arps = 1.to_f/4

first_arp = [:d4, :e3, :g3]
second_arp = [:e4, :gb3, :a3]
third_arp = [:a4, :a3, :db4]
third_arp_desc = [:g4, :a3, :db4]
third_arp_desc2 = [:gb4, :a3, :db4]
fourth_arp = [:gb4, :g3, :b3]

bass_line = [[:e2, 0.25], [:e2, 0.25], [:a2, 0.5], [:d3, 0.5], [:e3, 6],
             [:gb3, 7.5], [:a2, 7], [:e2, 0.25], [:gb2, 0.25], [:g2, 1],
             [:gb2, 1], [:e2, 1], [:e3, 3.5]]

live_loop :arpeggios do
  10.times do
    first_arp.each do |n|
      play n
      sleep slp_arps
    end
  end
  
  10.times do
    second_arp.each do |n|
      play n
      sleep slp_arps
    end
  end
  
  4.times do
    third_arp.each do |n|
      play n
      sleep slp_arps
    end
  end
  
  3.times do
    third_arp_desc.each do |n|
      play n
      sleep slp_arps
    end
  end
  
  3.times do
    third_arp_desc2.each do |n|
      play n
      sleep slp_arps
    end
  end
  
  10.times do
    fourth_arp.each do |n|
      play n
      sleep slp_arps
    end
  end
end

live_loop :bass do
  use_synth :bass_foundation
  with_fx :lpf, cutoff: 30 do
    bass_line.each do |n|
      play n[0], amp: 8
      sleep n[1]
    end
  end
end

live_loop :kick do
  sample :drum_bass_soft, amp: 1.5
  sleep 0.25
  sample :drum_bass_soft, amp: 1.2
  sleep 3.75
end

# Hi-hat loop sincronizzato con il kick
live_loop :hi_hat do
  loop do
    sample :drum_cymbal_closed, amp: 0.25
    sleep 0.25
  end
end


live_loop :snare do
  loop do
    sleep 0.5
    sample :drum_snare_soft, amp: 1
    sleep 0.385
    sample :drum_snare_soft, amp: 0.7
    sleep 0.115
  end
end

#live_loop :kick1 do  #cassa 1
#  sample :bd_ada, amp: 1
#  sleep 0.5
#end

#live_loop :kick2 do #cassa 2
#  sleep 0.25
#  sample :bd_zum, amp: 0.8  #oppure drum_bass_soft
#  sleep 0.25
#  sleep 1
#end

#live_loop :snare do  #snare
#  sync :kick1
#  sleep 0.5
#  sample :sn_dub, amp: 0.5
#end

#live_loop :close_hat do  #close_hat
#  with_fx :echo do
#    sync :kick1
#    sleep 0.25
#    sample :hat_bdu, amp: 1
#    sleep 0.25
#  end
#end

#live_loop :ride do  #ride
#  sync :kick1
#sample :drum_cymbal_soft, amp: 0.8
#  sleep 0.25
#end


