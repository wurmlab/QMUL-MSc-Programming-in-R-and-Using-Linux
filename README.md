# MSc practicals: Programming in R and using Unix

This is part of QMUL's SBCM032 Statistics & Bioinformatics MSc-level course. 

For each year, we include a series of practicals that teach the basics of programming (in R) and the basics of unix. The R practicals include the teaching of regex, functions, loops and if statements. The R practicals are generally based on the BSc programming course, which generally happens before the MSc course.

## Public data on the website

For each year, any file in the `public` folder gets automatically pushed to the gh-pages branch and therefore to our website. Any `*.md` file outside the filder gets converted to `html` and pushed to gh-pages and website.

A file named 2015/prac1-regex.md will be pushed to:

http://wurmlab.github.io/QMUL-MSc-Programming-in-R-and-Using-Linux/2015/prac1-regex.html

A file in the 2015/public folder (e.g. 2015/public/coursework/example_data.txt) would go to:

http://wurmlab.github.io/QMUL-MSc-Programming-in-R-and-Using-Linux/2015/coursework/example_data.txt

This is coded in deploy.sh and .travis.yml.

## Contributors

[Yannick Wurm](http://yannick.poulet.org), [Rodrigo Pracana](http://www.sbcs.qmul.ac.uk/staff/rodrigopracana.html), [Bruno Vieira](https://github.com/bmpvieira) (and other demonstrators).
