use_bpm 80


define :my_play_chord do |chord, release_time=1|
  with_synth :prophet do  # 使用合成器
    play_chord chord, release: release_time
  end
  sleep 1
end


define :play_arpeggio do |chord, sleep_time=0.25|
  with_synth :blade do  # 使用合成器
    chord.each do |note|
      play note
      sleep sleep_time
    end
  end
end


define :chord_progression do
  
  my_play_chord [:E, :G, :B, :D]    # Em7
  my_play_chord [:Fs, :A, :Cs, :E]  # F#m7
  my_play_chord [:A, :Cs, :E]       # A
  my_play_chord [:G, :B, :D, :Fs]   # Gmaj7
  
  
  my_play_chord [:D, :F, :A, :C]     # Dm7
  my_play_chord [:A, :C, :E]         # A7
  my_play_chord [:C, :E, :G]         # C
  my_play_chord [:B, :D, :Fs]        # Bm7
end


define :arpeggio_progression do
  
  play_arpeggio [:E, :G, :B, :D]    # Em7 琶音
  play_arpeggio [:Fs, :A, :Cs, :E]  # F#m7 琶音
  play_arpeggio [:A, :Cs, :E]       # A 琶音
  play_arpeggio [:G, :B, :D, :Fs]   # Gmaj7 琶音
  
  
  play_arpeggio [:D, :F, :A, :C]     # Dm7 琶音
  play_arpeggio [:A, :C, :E]         # A7 琶音
  play_arpeggio [:C, :E, :G]         # C 琶音
  play_arpeggio [:B, :D, :Fs]        # Bm7 琶音
end


define :drum_pattern do
  with_synth :tb303 do  # 使用合成器
    sample :bd_808, amp: 2  # 低音鼓
    sleep 0.25              # 每隔0.25秒
    sample :sn_dolf, amp: 1  # 小鼓
    sleep 0.25              # 每隔0.25秒
    sample :drum_cymbal_closed, amp: 1.5  # 闭口镲
    sleep 0.25              # 每隔0.25秒
    sample :drum_cymbal_open, amp: 1.2    # 开口镲
    sleep 0.5               # 每隔0.5秒
  end
end


define :ambient_sound do
  sample :ambi_soft_buzz, amp: 0.3  # 轻柔的环境音效
end

# 和声的函数
define :harmony_pattern do
  with_synth :prophet do
    play [:E, :G, :B, :D, :Fs, :A, :Cs].choose, release: 2, amp: 0.5  # 随机和声音符
  end
end


live_loop :chords do
  chord_progression
end


live_loop :arpeggios do
  sync :chords
  arpeggio_progression
end


live_loop :drums do
  sync :chords
  drum_pattern
end


live_loop :sounds do
  sync :chords
  ambient_sound
  sleep 2
end


live_loop :harmony do
  sync :chords
  harmony_pattern
  sleep [1.5, 2].choose
end


live_loop :drum_thread do
  sync :chords
  in_thread do
    drum_pattern
  end
end
