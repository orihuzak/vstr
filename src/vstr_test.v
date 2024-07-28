module vstr

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
