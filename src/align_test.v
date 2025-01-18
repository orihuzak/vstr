module strv

fn test_align() {
	mut m := map[string]string{}

	m['hello'] = '100'
	m['ありがと'] = '2'
	assert align(m) == 'hello:    100
ありがと: 2
'
}
