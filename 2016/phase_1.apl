⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 1
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⍝ cases not passed: nil, scalar
mean ← {(+/⍵)÷⍴⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 2
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⍝ cases not passed: nil, scalar
median ← {(⌈¯1+(⍴⍵)÷2) {(-⍺)↓⍺↓⍵} (⊂⍋⍵)⌷⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 3
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

mode ← {∪ ⍵ /⍨ {⍵=⌈/⍵} +/¨ (⊂⍵)=⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 4
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

mesh ← {{∊(' '≠⍵)⊂⍵} ∊ {⍺ ,[1.1] ⍵}/ (⊂(⍴⍺)⌈⍴⍵) {⍵,(⍺-⍴⍵)⍴' '}¨ (⍺) (⍵)}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 5
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⍝ can't pass the 'hello world' use case, but that doesn't seem to match what they want anyway

singleton_elements ← {∊ (1= +/¨ (∪⍵)=⊂⍵) ⊂ ∪⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 6
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

length_sort ← {(⊂⍋⍴¨⍵)⌷⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 7
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⍝ is_integer ← {0=⍵-⌊⍵}
multiples_of_three_and_five ← {∊ (∨/¨ is_integer ⍵ ÷ ⊂3 5) ⊂ ⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 8
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⍝ split_negative_and_positive ← {{(+/0>⍵) {(⍺↑⍵) (⍺↓⍵)} ⍵} (⊂⍋⍵)⌷⍵}
split_negative_and_positive ← {((+/0>⍵) - 0,⍴⍵) ↑¨ ⊂(⊂⍋⍵)⌷⍵}

⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝ problem 9
⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

⍝ cases not handled: equal delimeter and input

split ← {(~⍵∊⍺)⊂⍵}


