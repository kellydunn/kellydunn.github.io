all:
	harp _harp .
	wkhtmltopdf --enable-local-file-access --images resume.html assets/resume.pdf

clean:
	rm resume.html
	rm assets/resume.pdf