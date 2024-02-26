module vstr

pub fn is_en_letters(s string) bool {
	return s.runes().all(is_en_letter(it))
}

pub fn is_en_letter(c rune) bool {
	return (c >= `a` && c <= `z`) || (c >= `A` && c <= `Z`)
}

pub fn capitalize(s string) string {
	return s.to_lower().capitalize()
}
