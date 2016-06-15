⍝ problem 1

is_right_triangle ← {⍵}

⍝ problem 2

split ← {(~⍵∊' ')⊂⍵}
join ← {⊃{⍺,' ',⍵}/⍵}
tweetify ← {join {⊃,/ ⍵ ⊂⍨ ~(0,((¯2+⍴⍵)⍴1),0) ∧ ⍵∊'aeiou'}¨ split ⍵}

⍝ problem 3

⍝ not finished yet... does not handle cases 0-1
fib ← {⊃ {⍵,+/¯2↑⍵}/ (⍵-1) ⍴ ⊂1 1}

⍝ problem 4

strip_spaces ← {⊃ {⍺,' ',⍵}/ (~' '=⍵) ⊂ ⍵}
