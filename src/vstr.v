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

pub type Strings = []string

pub fn (a Strings) align_by_sep(separator string) Strings {
	mut longest_sep_pos := 0
	for s in a {
		if sep_pos := s.index(separator) {
			if longest_sep_pos < sep_pos {
				longest_sep_pos = sep_pos
			}
		}
	}

	if longest_sep_pos == 0 {
		return a
	}

	mut aligned_strings := Strings{cap: a.len}
	for s in a {
		if sep_pos := s.index(separator) {
			diff := longest_sep_pos - sep_pos
			aligned_strings << ' '.repeat(diff) + s
		} else {
			aligned_strings << s
		}
	}
	return aligned_strings
}
