
export READ_CLIENTS=16
export READ_THREADS=8
export READ_TIME=30 # Benchmark duration
export READ_PROGRESS=1 # show progress every 1 sec

echo "pgbench -c $READ_CLIENTS -j $READ_THREADS -T $READ_TIME -P $READ_PROGRESS  -f read-simple.sql --report-latencies"
pgbench -c $READ_CLIENTS -j $READ_THREADS -T $READ_TIME -P $READ_PROGRESS  -f read-simple.sql --report-latencies