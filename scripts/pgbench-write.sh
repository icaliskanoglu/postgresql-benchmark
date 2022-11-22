export WRITE_CLIENTS=16
export WRITE_THREADS=8
export WRITE_TIME=30 # Benchmark duration
export WRITE_PROGRESS=1 # show progress every 1 sec

echo "pgbench -c $WRITE_CLIENTS -j $WRITE_THREADS -T $WRITE_TIME -P $WRITE_PROGRESS  -f /write-benchmark.sql --report-latencies"
pgbench -c $WRITE_CLIENTS -j $WRITE_THREADS -T $WRITE_TIME -P $WRITE_PROGRESS  -f /write-benchmark.sql --report-latencies