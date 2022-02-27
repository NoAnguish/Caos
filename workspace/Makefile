SHELL=/bin/bash
target := ""

build: 
	@gcc -m32 $(target) simpleio_i686.S -no-pie -o output

run: 
	@gcc $(target) -o output
	@./output

exec:
	@./output
