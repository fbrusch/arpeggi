$sleeptTime = 16
$realeaseTime = 15

use_bpm 153

$hihat = :drum_cymbal_closed
$kick = :bd_tek
$snare = :sn_dolf
$snare2 = :elec_hi_snare
$snare3 = :sn_zome
$rimshot = :sc808_clap
$open_hat = :sc808_open_hihat


define :kick do
  sample $kick, amp: 2.5
  sleep 0.5
  sample $kick, amp: 2.5
  sleep 7.5
  sample $kick, amp: 2.5
  sleep 8
end

define :snare2 do
  with_fx :distortion, distort: 0.7 do
    with_fx :lpf, cutoff: 50 do
      sleep 1
      sample $snare3, amp: 0.9
      sleep 0.75
      sample $snare3, amp: 0.5
      sleep 1.25
      sample $snare3, amp: 0.9
      sleep 0.75
      sample $snare3, amp: 0.5
      sleep 1.25
      sample $snare3, amp: 0.9
      sleep 0.75
      sample $snare3, amp: 0.5
      sleep 1.25
      sample $snare3, amp: 0.9
      sleep 0.75
      sample $snare3, amp: 0.5
      sleep 0.25
    end
  end
end

define :toms do
  sleep 62
  sample :drum_tom_hi_hard
  sleep 0.75
  sample :drum_tom_mid_hard
  sleep 0.75
  sample :drum_tom_lo_hard
  sleep 0.50
end

in_thread do
  sleep 20
  loop do
    toms
  end
end

define :crash do
  with_fx :level, amp: 1.8 do
    with_fx :reverb, room: 0.99  do
      with_fx :echo, decay: 8, phase: 0.50, amp: 0.25 do
        sample :hat_zan
        sleep 16
      end
    end
  end
end

define :snare do
  with_fx :distortion, amp: 0.6, distort: 0.5 do
    sleep 1
    sample $snare, amp: 0.8
    sample $snare2, amp: 0.9
    sleep 0.75
    sample $snare, amp: 0.3
    sample $snare2, amp: 0.4
    sleep 1.25
    sample $snare, amp: 0.8
    sample $snare2, amp: 0.9
    sleep 0.75
    sample $snare, amp: 0.3
    sample $snare2, amp: 0.4
    sleep 1.25
    sample $snare, amp: 0.8
    sample $snare2, amp: 0.9
    sleep 0.75
    sample $snare, amp: 0.3
    sample $snare2, amp: 0.4
    sleep 1.25
    sample $snare, amp: 0.8
    sample $snare2, amp: 0.9
    sleep 0.75
    sample $snare, amp: 0.3
    sample $snare2, amp: 0.4
    sleep 0.25
  end
end

define :hithats do
  8.times do
    sample $hihat, amp: 0.65, pan: rand(-0.5..0)
    sleep 0.5
  end
  8.times do
    sample $hihat, amp: 0.65, pan: rand(0..0.5)
    sleep 0.5
  end
end

define :play_second_hat do |amp, sleep_times|
  sleep sleep_times[:initial_sleep]
  sleep_times[:hats].each do |time|
    sample $hihat, amp: amp
    sleep time
  end
end

define :bass do
  use_synth :bass_foundation
  
  define :play_bass do |note, times, amp|
    times.times do
      play note, amp: amp
      sleep 0.5
      play note, amp: amp
      sleep 2.5
    end
    play note, amp: amp
    sleep 0.5
    play note, amp: amp
    sleep 1.5
  end
  play_bass(:e1, 2, 1.75)
  play_bass(:e1, 2, 1.25)
  play_bass(:fs1, 2, 1.75)
  play_bass(:fs1, 2, 1.25)
  play_bass(:a1, 2, 1.75)
  play_bass(:a1, 2, 1.25)
  play_bass(:g1, 2, 1.75)
  play_bass(:g1, 2, 1.25)
end


define :secondhat do
  play_second_hat(0.35, { initial_sleep: 1.5, hats: [0.25, 0.25, 2] })
end


chords = [ chord(:e, :minor7), chord(:d, :major) + [:e3], chord(:a, :major), chord(:g, :dom7)]

define :pad_chords do
  play chord(:e, :m7), amp: 1.3, attack: 3, release: $realeaseTime, pan: -0.15
  sleep $sleeptTime
  play chord(:Fs3, :m7) , amp: 1.3, attack: 3, release: $realeaseTime, pan: -0.15
  sleep $sleeptTime
  play chord(:a, :major), amp: 1.3, attack: 3, release: $realeaseTime, pan: -0.15
  sleep $sleeptTime
  play [:g3, :b3, :d4, :fs4], amp: 1.3, attack: 3, release: $realeaseTime, pan: -0.15
  sleep $sleeptTime
end

define :arpeggiate_chord do |chord|
  chord.each do |note|
    play note, amp: 2, attack: 0.5, release: 1, pan: 0.20
    sleep 0.5
  end
end

define :arp_synth do
  arpeggiate_chord(chord(:b, :minor7))
  sleep 0.5
  arpeggiate_chord(chord(:d, '9'))
  sleep 0.5
  arpeggiate_chord(chord(:a, :major))
  sleep 0.5
  arpeggiate_chord(chord(:g, '7'))
  sleep 0.5
end

in_thread do
  sleep 20
  loop do
    use_synth :bass_foundation
    with_fx :reverb, pre_amp: 1 do
      pad_chords
    end
  end
end


in_thread do
  sleep 84
  loop do
    with_fx :level, amp: 0.4 do
      with_fx :echo, decay: 0.25 do
        with_fx :reverb, amp: 0.75 do
          with_fx :hpf, cutoff: 35 do
            use_synth :mod_beep
            16.times do
              with_fx :reverb do
                pad_chords
              end
            end
          end
        end
      end
    end
  end
end


in_thread do
  sleep 20
  loop do
    with_fx :distortion, mix: 0.5, distort: 0.6 do
      bass
    end
  end
end

in_thread do
  sleep 84
  loop do
    with_fx :echo, decay: 0.75 do
      with_fx :reverb, amp: 0.3 do
        sample :guit_em9, amp: 1.6, pan: 0.15
        sleep 16
        sample :guit_em9, amp: 1.6, pitch: 7, pan: -0.10
        sleep 16
        sample :guit_em9, amp: 1.6, pitch: 5, pan: 0.20
        sleep 16
        sample :guit_em9, amp: 1.6, pitch: 5, pan: -0.15
      end
    end
  end
end



in_thread do
  sleep 4
  loop do
    crash
  end
end

in_thread do
  sleep 4
  loop do
    secondhat
  end
end

in_thread do
  sleep 4
  loop do
    kick
  end
end

in_thread do
  sleep 4
  loop do
    snare
  end
end
in_thread do
  sleep 4
  loop do
    snare2
  end
end

in_thread do
  sleep 4
  loop do
    hithats
  end
end

define :starter do
  sample $hihat
  sleep 1
  sample $hihat
  sleep 1
  sample $hihat
  sleep 1
  sample $hihat
  sleep 1
end

in_thread do
  starter
end

