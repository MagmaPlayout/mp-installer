#!/bin/bash -e
responseCode=0
coreError=""
libconfigError=""
meltedBackendError=""
meltedStatusError=""
devourerError=""



echo ""
echo "Building mp-libconfig..."
cd core/mp-libconfig/
ant jar >/dev/null

if [[ $? != 0 ]]; then
	libconfigError="mp-libconfig "
fi

cd -


echo ""
echo "Building mpc-meltedBackend..."
cd core/mpc-meltedBackend/
ant jar >/dev/null

if [[ $? != 0 ]]; then
	meltedBackendError="mpc-meltedBackend "
fi

cd -


echo ""
echo "Building mp-melted-status..."
cd core/mp-melted-status/
ant jar >/dev/null

if [[ $? != 0 ]]; then
	meltedStatusError="mp-melted-status "
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
if [ -n "$meltedBackendError" ] || [ -n "$meltedStatusError" ] || [ -n "$coreError" ] || [ -n "$devourerError" ] || [ -n "$libconfigError" ]; then
	echo "The following modules have errors: "$meltedBackendError$coreError$devourerError$meltedStatusError$libconfigError
	exit 1
fi

echo "Done."
exit 0



