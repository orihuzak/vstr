module strv

// Empty string -> none
pub struct EmptyIsNoneString {
	inner ?string
}

pub fn (o EmptyIsNoneString) opt_str() ?string {
	return o.inner
}

pub fn EmptyIsNoneString.new(s string) EmptyIsNoneString {
	return EmptyIsNoneString{
		inner: if s.len == 0 {
			none
		} else {
			s
		}
	}
}

pub struct NonEmptyString {
	inner string
}

pub fn NonEmptyString.new(s string) !NonEmptyString {
	if s.len == 0 {
		return error('non empty string required')
	}
	return NonEmptyString{s}
}

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

// rune_space_size returns the number of rune types in s
pub fn rune_space_size(s string) int {
	space := rune_space(s)
	return space.len
}

pub fn rune_space(s string) []rune {
	mut space := []rune{cap: s.len}
	for r in s.runes() {
		if r !in space {
			space << r
		}
	}
	return space
}

pub fn is_first_rune(s string, ch rune) bool {
	if s.len == 0 {
		return false
	}
	return s.trim_space_left()[0] == ch
}
