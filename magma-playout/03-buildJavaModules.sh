#!/bin/bash -e
responseCode=0
coreError=""
meltedBackendError=""
devourerError=""

echo ""
echo "Building mpc-meltedBackend..."
cd core/mpc-meltedBackend/
ant jar >/dev/null

if [[ $? != 0 ]]; then
	meltedBackendError="mpc-meltedBackend "
fi

cd -



echo ""
echo "Building mp-core..."
cd core/mp-core/
ant jar >/dev/null

if [[ $? != 0 ]]; then
	coreError="mp-core "
fi

cd -


echo ""
echo "Building mp-devourer..."
cd store/mp-devourer/
ant jar >/dev/null

if [[ $? != 0 ]]; then
	devourerError="mp-devourer "
fi

cd -


echo ""
if [ -n "$meltedBackendError" ] || [ -n "$coreError" ] || [ -n "$devourerError" ]; then
	echo "The following modules have errors: "$meltedBackendError$coreError$devourerError
	exit 1
fi

echo "Done."
exit 0



