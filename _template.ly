\version "2.24.3"
\language "english"
\paper { 
  #(set-paper-size "a4")
  indent = 0
}

\include "_drums_lib.ly"
\include "_drums_style.ly"

\header {
  title = "Title"
  subtitle = "X"
  composer = "Author"
  tagline = ""
}

up_changed = \drummode {
  \stemUp
  sn4^"snare" ss s2  |
  tomh4^"toms" tommh toml s |
  bd4^"bass" s2.  |
  hh4^"hihat" hhc hho hhho |
  hhp4^"pedal" s2. |
  cymr4^"ride" rb s2 |  
  crashcymbal4^"crash+splash" cyms s2
}  
\score { 
  << 
    \new DrumStaff 
    << 
      \set DrumStaff.drumStyleTable = #(alist->hash-table drums-style)
      \mark "Notation"
      \up_changed 
    >> 
  >> 
}


up_four = \drummode {
  \stemUp
  \hide Staff.TimeSignature
  \override Beam.positions = #'(5 . 5)

  bd8[hh] sn[hh] bd[<bd hh>] sn[hh] 
}  
\score {
  << 
    \new DrumStaff 
    {
      \set DrumStaff.drumStyleTable = #(alist->hash-table drums-style)
      \numericTimeSignature 
      \time 4/4
      %%\tempo 4 = 60
      \stemUp
      
      \up_four
    }
  >> 
}

