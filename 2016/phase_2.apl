:Namespace Contest2016

AboutMe ← 'I am a young programmer who became fascinated with APL from the instant I saw it.'
AboutMe ← AboutMe,' I do not believe APL is the most practical language for general purpose programming, but it is such a great way to approach certain problems.'
AboutMe ← AboutMe,' I have always had a large interest in programming languages and, one day, wish to write my own language.'
AboutMe ← AboutMe,' At this point in time, it is pretty likely that I will be taking heavy inspiration from APL, as well as some more practical general purpose programming languages.'

⍝ TODO
Reaction ← ''

:Namespace gen
board_a ← 5 5 ⍴ '○○○○○○○BB○RRBB○○RR○○○○○○○'
board_b ← 5 5 ⍴ '○○○○○○○B○BRRBB○○RR○○○○○○○'
board_c ← 5 5 ⍴ '○○○○○BBBB○RR○○○○RR○○○○○○○'
board_d ← 5 5 ⍴ '○○○B○○○○B○RR○B○○RRB○○○○○○'
board_e ← 5 5 ⍴ 'R○○BB○RBB○○○R○○○○○R○○○○○○'

⍝ ∇ r←color quad_winner board
⍝   r ← ∧/ {2=+/2=+/⍵}¨ {(⍵) (⍉⍵)} board∊color
⍝ ∇
⍝ 
⍝ ∇ r←color hv_line_winner board
⍝   r ← ∨/ {1=+/4=+/⍵}¨ {(⍵) (⍉⍵)} board∊color
⍝ ∇
⍝ 
⍝ ∇ r←color diagonal_winner board
⍝   ⍝ diagonal_indices ← (⊂,⍨¨1+⍳4) - (⊂1 1) (⊂0 1) (⊂1 0) (⊂0 0)
⍝   diagonal_indices ← (⊂(2 2) (3 3) (4 4) (5 5)) - (⊂1 1) (⊂0 1) (⊂1 0) (⊂0 0)
⍝   diagonals ← {diagonal_indices {⍺⌷¨⊂⍵}¨ ⊂⍵}¨ (board) (⌽board)
⍝   r ← ∨/ {∨/4=+/¨⍵}¨ color=diagonals
⍝ ∇

∇ r←winner board
  encoded_board ← (board='B') ∨ (5×board='R')
  diagonal_indices ← (⊂,⍨¨1+⍳4) - (⊂1 1) (⊂0 1) (⊂1 0) (⊂0 0)
  diagonals ← {diagonal_indices {⍺⌷¨⊂⍵}¨ ⊂⍵}¨ (encoded_board) (⌽encoded_board)
  board_rot_set ← (encoded_board) (⍉encoded_board)

  quad_winner ← {(∧/4=+/¨5|⍵) ∨ 5×∧/2=+/¨10≤⍵} +/¨ board_rot_set
  line_winner ← ∨/ {(∨/4=5|⍵) ∨ 5×∨/40≤⍵}¨ +/¨ board_rot_set,diagonals 
  r ← (|(quad_winner ∨ line_winner)-2)⌷'B○R'
  
  ⍝ winner_vector ← {(⍵ diagonal_winner board) ∨ (⍵ hv_line_winner board) ∨ (⍵ quad_winner board)}¨ 'BR'
  ⍝ r ← (1 + +/ (⍳2) × winner_vector)⌷'○BR'
∇

∇ r←expected counts
  sum ← +/+/counts
  row_column_products ← ∊ (+/counts) × ⊂+⌿counts
  r ← (⍴ counts) ⍴ row_column_products ÷ sum
∇

∇ r←chiSquareTest counts
  expected_counts ← expected counts
  r ← +/+/ ((counts - expected_counts) * 2) ÷ expected_counts
∇

⍝ GNU APL only

'lib_file_io.so' ⎕FX 'FILE_IO'

∇ r←read_file_contents filename
  file ← FILE_IO[3] filename
  0 FILE_IO[15] file
  length ← FILE_IO[12] file
  0 FILE_IO[13] file
  r ← ⎕UCS length FILE_IO[6] file
  FILE_IO[4] file
∇

∇ r←split_data_file_rows data
  r ← ¯1↓¨ (~ (⎕UCS 10) = data) ⊂ data
∇

drugs ← split_data_file_rows read_file_contents 'data/drugs.txt'
inputs ← split_data_file_rows read_file_contents 'data/inputs.txt'

page ← {((⍺-1)×10)↓(⍺×10)↑⍵}

∇ r←dir transpose vec 
  left_pad ← ((-0⌊dir)⍴' ')
  right_pad ← ((0⌈dir)⍴' ')
  r ← left_pad,((-dir) ↓ dir ⌽ vec),right_pad
∇

∇ r←drug matchesDrug input
  resized_input ← (0⌈-(⍴drug)-⍴input)↓input,(0⌈(⍴drug)-⍴input)⍴' ' 
  transposed_words ← ¯1 0 1 transpose¨ ⊂resized_input
  r ← (¯1+⍴drug) ≤ 0/ ⊃ ∨/ (⊂drug) =¨ transposed_words 
∇

⍝ direct_match ← ((⊂input)≡¨drugs) ⍳ 1
⍝ heuristic_match ← 1⌷⍒ +/¨ drugs ∊¨ ⊂input
⍝ r ← (1 + direct_match=(1+⍴drugs))⌷direct_match heuristic_match

∇ r←drugs matchDrugs inputs
  r ← {drugs matchesDrug¨ ⊂⍵}¨ inputs
∇
:EndNamespace
:EndNamespace
