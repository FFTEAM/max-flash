#!/bin/bash

CURDIR=$1

if [ -d $CURDIR/../../source/libstb-hal-next ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-next && git log | grep "^commit" | wc -l`-next
elif [ -d $CURDIR/../../source/libstb-hal-github ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-github && git log | grep "^commit" | wc -l`-github
elif [ -d $CURDIR/../../source/libstb-hal-martii-github ]; then
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal-martii-github && git log | grep "^commit" | wc -l`-martii-github
else
	HAL_REV=_HAL-rev`cd $CURDIR/../../source/libstb-hal && git log | grep "^commit" | wc -l`
fi

if [ -d $CURDIR/../../source/neutrino-mp-next ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-next && git log | grep "^commit" | wc -l`-next
elif [ -d $CURDIR/../../source/neutrino-mp-github ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-github && git log | grep "^commit" | wc -l`-github
elif [ -d $CURDIR/../../source/neutrino-mp-martii-github ]; then
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp-martii-github && git log | grep "^commit" | wc -l`-martii-github
else
	NMP_REV=_NMP-rev`cd $CURDIR/../../source/neutrino-mp && git log | grep "^commit" | wc -l`
fi

gitversion="_CDK-rev`(cd $CURDIR/../../cdk && git log | grep "^commit" | wc -l)`$HAL_REV$NMP_REV"

echo "GITVERSION   = $gitversion"
export gitversion
