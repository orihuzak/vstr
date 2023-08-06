module vstr

pub fn only_en_letter(s string) bool {
	for c in s.runes() {
		if !is_en_letter(c) {
			return false
		}
	}
	return true
}

pub fn is_en_letter(c rune) bool {
	return (c >= `a` && c <= `z`) || (c >= `A` && c <= `Z`)
}
