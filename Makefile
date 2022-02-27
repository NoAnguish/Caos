caos: 
	@docker build -t caos .
	@docker rm caos || true
	@docker run --name caos -i -t -v $(PWD)/workspace:/usr/local/workspace caos
