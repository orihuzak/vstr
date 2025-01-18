module strv

fn test_align() {
	mut m := Align(map[string]string{})
	m['hello'] = '100'
	m['ありがと'] = '2'
	assert m.aligned_str() == 'hello:    100
ありがと: 2
'
}
