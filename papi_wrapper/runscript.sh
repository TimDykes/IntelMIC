#!/bin/bash

DIRNAME=NEWLOGS
LOGNAME=SP_400M_236_no_clevict

export MIC_ENV_PREFIX=MIC
export MIC_LD_LIBRARY_PATH=$MIC_LD_LIBRARY_PATH:.:/users/dykest/Programs/papi
export OFFLOAD_INIT=on_start
export MIC_USE_2MB_BUFFERS=64K
export MIC_OMP_NUM_THREADS=236
export MIC_KMP_AFFINITY=granularity=fine,balanced

export MIC_PAPI_EVENTS=""

./mic_demo > $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="VPU_INSTRUCTIONS_EXECUTED|VPU_ELEMENTS_ACTIVE"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="CPU_CLK_UNHALTED|INSTRUCTIONS_EXECUTED"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="DATA_READ_OR_WRITE|DATA_READ_MISS_OR_WRITE_MISS"

./mic_demo >> $DIRNAME/$LOGNAME 

export MIC_PAPI_EVENTS="DATA_PAGE_WALK|LONG_DATA_PAGE_WALK" 

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="L2_DATA_READ_MISS_MEM_FILL"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="L2_DATA_WRITE_MISS_MEM_FILL"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="L2_VICTIM_REQ_WITH_DATA"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="L1_DATA_HIT_INFLIGHT_PF1"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="SNP_HITM_L2"

./mic_demo >> $DIRNAME/$LOGNAME

export MIC_PAPI_EVENTS="EXEC_STAGE_CYCLES"

./mic_demo >> $DIRNAME/$LOGNAME