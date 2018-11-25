
CREATE KEYSPACE finance_prod
WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
};

CREATE TABLE finance_prod.record (
    exchange ascii,
    symbol ascii,
    period ascii,
    datetime timestamp,
    name text,
    open decimal,
    high decimal,
    low decimal,
    close decimal,
    volume bigint,
    PRIMARY KEY ((exchange, symbol, period), datetime)
)
WITH CLUSTERING ORDER BY (datetime ASC)
AND caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};

