⍝ problem 1

uppercase_vector ← 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
lowercase_vector ← 'abcdefghijklmnopqrstuvwxyz'
downcase_character ← {(uppercase_vector⍳⍵)⌷lowercase_vector,⍵}
anagram ← {{(⍴⍵)=+/⍵} ⊃ ∊/ {downcase_character¨ ⊃ ,/ (~⍵∊'!# ')⊂⍵}¨ ⍺ ⍵}

⎕ ← 'anagram' anagram 'Nag A Ram'
⎕ ← 'Dyalog APL' anagram 'Dog Pay All'
⎕ ← '' anagram '  !#!'
⎕ ← 'abcde' anagram 'zyxwvu'

⍝ problem 2

pairs ← {((¯1+⍴⍵),2) ⍴ (1,((¯2+⍴⍵)⍴2),1) / ⍵}
max ← {(1⌷⍒⍵)⌷⍵}
longest_streak ← {max +/¨ ⊂⍨ </ pairs ⍵}

⎕ ← longest_streak ⍳9
⎕ ← longest_streak 1
⎕ ← longest_streak 9 8 7 6 5 4
⎕ ← longest_streak 1 5 3 4 2 6 7 8

⍝ problem 3

⍝ problem 4

⍝ problem 5

mean ← {(+/⍵)÷⍴⍵}
standard_deviation ← {{0.5 *⍨ (⍴⍵) ÷⍨ +/ 2 *⍨ ⍵ - mean ⍵} ,⍵}
⍝ standard_deviation ← {{((+/ (⍵ - mean ⍵) * 2) ÷ ⍴⍵) * 0.5} ,⍵}

⎕ ← standard_deviation ⍳5
⎕ ← standard_deviation 10 10 ⍴ ⍳100

⍝ problem 6


