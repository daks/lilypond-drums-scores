\version "2.24.3"
\language "english"
\paper { 
  #(set-paper-size "a4")
  indent = 0
}

\include "lib/drums_ornaments.ly"
\include "lib/drums_style.ly"

\header {
  title = "Seven Nation Army"
  subtitle = "The White Stripes"
  composer = ""
  tagline = "The White Stripes - Seven nation army ‑ v1 (2026-03)"
}
%% source : https://youtu.be/gQ4DJmMKrdE

%%%%%%%%%%%%%%%%%%%%%
up_changed = \drummode {
  \stemUp
  hh4^\markup \rotate #45 "hihat" s4
  hhp^\markup \rotate #45 "hh pedal" s4
  s4 hhho^\markup \rotate #45 "hh half open" s4
  cymr4^\markup \rotate #45 "ride" s4
  cymc4^\markup \rotate #45 "crash" 
}  
\score { << \new DrumStaff << 
  \set DrumStaff.drumStyleTable = #(alist->hash-table drums-style)
  \time 8/4
  \hide Staff.TimeSignature
  \up_changed >> >> 
}

%%%%%%%%%%%%%%%%%%%%%%
pattern_a = \drummode {
  <toml hhp bd>4 <toml hhp bd> <toml hhp bd> <toml hhp bd> |
  <toml hhp bd>4 <toml hhp bd> <toml hhp bd> <toml hhp bd> |
  <toml hhp bd>4 <toml hhp bd> <toml hhp bd> <toml hhp bd> |
  <toml hhp bd>4 <toml hhp bd> <toml hhp bd> <toml hhp bd> |
}

pattern_b = \drummode {
  <toml hhp bd>4 <sn toml hhp bd> <toml hhp bd> <sn toml hhp bd> |
  <toml hhp bd>4 <sn toml hhp bd> <toml hhp bd> <sn toml hhp bd> |
  <toml hhp bd>4 <sn toml hhp bd> <toml hhp bd> <sn toml hhp bd> |
  <toml hhp bd>4 <sn toml hhp bd> <toml hhp bd> <sn toml hhp bd> |
}

pattern_c = \drummode {
  
  <cymc hhp bd>4 <toml bd hhp>8-"R"^\< toml-"L" <toml bd hhp>8-"R" toml-"L" <toml bd hhp>8-"R" toml-"L"\! |
  <cymc hhp bd>4 <toml bd hhp>8-"R"^\< toml-"L" <toml bd hhp>8-"R" toml-"L" <toml bd hhp>8-"R" toml-"L"\! |
}

pattern_d = \drummode {
  <cymc bd>4 <cymc sn> <cymc bd> <cymc sn> |
  <cymc bd>4 <cymc sn> <cymc bd> <cymc sn> |
  <cymc bd>4 <cymc sn> \tuplet 3/2 { <cymc bd>8 r <cymc sn> } \tuplet 3/2 { r <cymc bd> r } |
  <cymc bd>4 <cymc sn> <cymc bd> <cymc sn> |
}

pattern_e = \drummode {
  <cymc bd>4 r r r |
}

%%%%%%%%%%%%%%%%%%%
intro = \drummode {
r1 | r1 | r1 | r1 |
}

verse = \drummode {
  \repeat volta 3 {
    \pattern_a
  } \mark \markup \small "x3"
  
  \repeat volta 2 {
    \pattern_b
  }
}

chorus = {
  \pattern_c
  \repeat volta 2 {
    \pattern_d
  }
  \pattern_c
}

chorus_two = {
  \pattern_c
  \repeat volta 4 {
    \pattern_d
  } \mark \markup \small "x4"
  \pattern_c
}

chorus_final = {
  \pattern_c
  \repeat volta 4 {
    \pattern_d
  } \mark \markup \small "x4"
}

%%%%%%%%%%%%%%%%%%%%
\score {
  << \new DrumStaff {
    \set DrumStaff.drumStyleTable = #(alist->hash-table drums-style)
    \numericTimeSignature 
    \time 4/4
    \tempo 4 = 95
    \stemUp
    \override Beam.positions = #'(5 . 5)
    % pour aligner les L/R
    \override TextScript.staff-padding = 3.5
    
    \intro
     
    %\break
    \section \sectionLabel "Verse" {
      \verse
    }
 
    %\break
    \section \sectionLabel "Chorus" {
      \chorus
    }
    
    \pattern_e | r | r | r |
    
    %\break  
    \section \sectionLabel "Verse" {
      \verse
    }
    
    %\break
    \section \sectionLabel "Chorus" {
      \chorus_two
    }
    
    \pattern_e | r | r | r |
    
    %\break
    \section \sectionLabel "Verse" {
      \verse
    }
 
    %\break
    \section \sectionLabel "Chorus" {
      \chorus_final
    }
    \pattern_e | r | \pattern_e |

  }
  >> 
}