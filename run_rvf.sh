python3 ../../checks/genchecks.py
if [ -z "$1" ]
then
	make -C checks/
else
	make -C checks/ -j$1
fi
