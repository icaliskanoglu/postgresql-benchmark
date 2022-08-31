export BENCHMARK_HOST=$DB_HOST
export PGPASSWORD=$DB_PASSWORD
export BENCHMARK_PORT=5432
export BENCHMARK_DB=ihsan
export BENCHMARK_USER=postgres
# pgbench control environment variables
export BENCHMARK_CONNECTIONS=16
export BENCHMARK_THREADS=8
export BENCHMARK_SQL_FILE=read-benchmark.sql
# time in seconds to run test
export BENCHMARK_TIME=300

psql -h $BENCHMARK_HOST -p $BENCHMARK_PORT -f create-database-if-not-exist.sql -U $BENCHMARK_USER


pgbench -c $BENCHMARK_CONNECTIONS -j $BENCHMARK_THREADS -T $BENCHMARK_TIME -U $BENCHMARK_USER -d $BENCHMARK_DB -h $BENCHMARK_HOST -p $BENCHMARK_PORT -f $BENCHMARK_SQL_FILE
