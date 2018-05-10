#!/bin/bash
EXE=/go/bin/java-buildpack-memory-calculator
JAVA=java
EXTRA_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=1"
LOADEDCLASSES=$((400*$1))
STACKTHREADS=$((15 + $1 * 6 / 10))

FULL_CMD="$EXE -loadedClasses $LOADEDCLASSES -poolType metaspace -stackThreads $STACKTHREADS -totMemory $2"
#echo "Full CMD: $FULL_CMD"
#echo

unset t_std t_err
eval "$( ($FULL_CMD) 2> >(readarray -t t_err; typeset -p t_err) > >(readarray -t t_std; typeset -p t_std) )"

if [ -n "$t_err" ]; then
    echo "$t_err"
    exit -1
fi

if [ -n "$t_std" ]; then
    echo "$EXTRA_OPTS $t_std"
    exit 0
fi
