//
//  Vowels.swift
//  Count_V
//
//  Created by User-UAM on 10/19/24.
//

import Foundation

class VowelCounter {
    func countVowels(in text: String) -> Int {
        let vowels = "aeiouáéíóúAEIOUÁÉÍÓÚ"
        return text.filter { vowels.contains($0) }.count
    }
}
