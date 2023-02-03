## PostgreSQL Benchmark
A docker compose to run penchmark against PostgreSQL databases.

### Steps

#### Configure Environment Variables
Fill the .env_file with your database configurations
```
PGHOST=localhost
PGPASSWORD=postgres
PGUSER=postgres
PGDATABASE=postgres 
```

#### Init Database

Create tables you defined in init-db.sql

```
docker-compose -f benchmark-compose.yaml up db-init
```

#### Init Benchmark
`pgbench -i` commands will create a bunch of row in your tables.

Change configurations in `scripts/pgbench-init.sh`

Run:
```
docker-compose -f benchmark-compose.yaml up pgbench-init
```

#### Run Write Benchmark

Write benchmark will generates a lot of INSERT/UPDATE operations against your database. After it finish the process it will show write statistics. 

Change configurations in `scripts/pgbench-write.sh`

Run:
```
docker-compose -f benchmark-compose.yaml up pgbench-write
...

scaling factor: 1
query mode: simple
number of clients: 16
number of threads: 8
duration: 30 s
number of transactions actually processed: 118137
latency average = 4.056 ms
latency stddev = 2.093 ms
tps = 3935.925178 (including connections establishing)
tps = 3936.592897 (excluding connections establishing)

```


#### Run Read Benchmark

Write benchmark will generates a lot of SELECT operations against your database. After it finish the process it will show write statistics.

Change configurations in `scripts/pgbench-read.sh`

Run:

```
docker-compose -f benchmark-compose.yaml up pgbench-read
...

scaling factor: 1
query mode: simple
number of clients: 16
number of threads: 8
duration: 30 s
number of transactions actually processed: 330378
latency average = 1.442 ms
latency stddev = 1.224 ms
tps = 11001.976114 (including connections establishing)
tps = 11004.106083 (excluding connections establishing)

```


Run:

```
docker-compose -f benchmark-compose.yaml up pgbench-read-simple
...

scaling factor: 1
query mode: simple
number of clients: 16
number of threads: 8
duration: 30 s
number of transactions actually processed: 330378
latency average = 1.442 ms
latency stddev = 1.224 ms
tps = 11001.976114 (including connections establishing)
tps = 11004.106083 (excluding connections establishing)

```

Not:
TPS: Transactions per Second 