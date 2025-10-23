
load:
	cat load.list | python3 gen "module load " > l1
	cat l1 prl > load
	rm l1

find.list:
	cat replace.list | python3 gen "/usr/bin/" > find.list

which.list: load
	cat replace.list | python3 gen "which " > w1
	cat load w1 | bash > which.list
	rm w1

mkedit: find.list
	python3 zip find.list which.list | python3 gen "python3 findreplace "| bash > p3
	cat p3 mpi.sed > mkedit
	rm p3

s_setup: mkedit load
	cat setupheader load conf mkedit > s_setup
	#sbatch s_setup

s_make: load
	cat makeheader load make > s_make
	#sbatch s_make

s_test: load
	cat testheader load maketest > s_test
	#sbatch s_test
