module vstr

fn test_only_en_letter() {
	assert only_en_letter('amz') == true
	assert only_en_letter('AMZ') == true
	assert only_en_letter('aMz') == true
	assert only_en_letter('a5z') == false
	assert only_en_letter('a🧊z') == false
	assert only_en_letter('aまz') == false
	assert only_en_letter('a%z') == false
}

fn test_is_en_letter() {
	assert true == is_en_letter(`a`)
	assert true == is_en_letter(`m`)
	assert true == is_en_letter(`Z`)
	assert false == is_en_letter(`ま`)
	assert false == is_en_letter(`5`)
	assert false == is_en_letter(`🫠`)
}
