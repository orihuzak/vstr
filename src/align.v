module strv

import strings

pub type Align = map[string]string

pub fn (a &Align) aligned_str() string {
	pad := ' '
	max_len := max_length_with_multi_bytes(a.keys())
	mut buf := strings.new_builder(100)
	for k, v in a {
		pad_len := max_len - length_with_multi_bytes(k)
		buf.write_string2(k, ': ')
		if pad_len > 0 {
			buf.write_string(pad.repeat(pad_len))
		}
		buf.writeln(v)
	}
	return buf.str()
}

fn max_length_with_multi_bytes(a []string) int {
	mut max_len := 0
	for s in a {
		len := length_with_multi_bytes(s)
		if len > max_len {
			max_len = len
		}
	}
	return max_len
}

fn is_multi_bytes(r rune) bool {
	return r.length_in_bytes() > 1
}

fn length_with_multi_bytes(s string) int {
	mut length := 0
	for r in s.runes() {
		if is_multi_bytes(r) {
			length += 2
		} else {
			length += 1
		}
	}
	return length
}
