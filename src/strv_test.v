module strv

fn test_empty_is_none_string() {
	s := EmptyIsNoneString.new('')
	if s.opt_str() == none {
		assert true
	}
}

fn test_non_empty_string() {
	NonEmptyString.new('') or {
		eprintln(err)
		assert true
	}
}

fn test_is_en_letters() {
	assert is_en_letters('amz') == true
	assert is_en_letters('AMZ') == true
	assert is_en_letters('aMz') == true
	assert is_en_letters('a5z') == false
	assert is_en_letters('a🧊z') == false
	assert is_en_letters('aまz') == false
	assert is_en_letters('a%z') == false
}

fn test_is_en_letter() {
	assert true == is_en_letter(`a`)
	assert true == is_en_letter(`m`)
	assert true == is_en_letter(`Z`)
	assert false == is_en_letter(`ま`)
	assert false == is_en_letter(`5`)
	assert false == is_en_letter(`🫠`)
}

fn test_capitalie() {
	assert capitalize('hello') == 'Hello'
	assert capitalize('heLLO') == 'Hello'
}

fn test_align() {
	texts := Strings([
		'test: test',
		'testtest: test',
		'testte: test',
	])
	want := [
		'    test: test',
		'testtest: test',
		'  testte: test',
	]
	assert texts.align_by_sep(':') == want
}

struct SpaceSizeCase {
	input string
	want  int
}

fn test_rune_space_size() {
	cases := [
		SpaceSizeCase{'YYYYMMDD', 3},
		SpaceSizeCase{'しんぶんし', 3},
	]
	for case in cases {
		assert rune_space_size(case.input) == case.want
	}
}

struct SpaceCase {
	input string
	want  []rune
}

fn test_rune_space() {
	cases := [
		SpaceCase{'successfully', [`s`, `u`, `c`, `e`, `f`, `l`, `y`]},
		SpaceCase{'しんぶんし', [`し`, `ん`, `ぶ`]},
	]
}

fn test_is_first_char() {
	assert is_first_char(' > hello', `>`) == true
}
