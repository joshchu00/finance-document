
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

CREATE TABLE finance_prod.indicator (
    exchange ascii,
    symbol ascii,
    period ascii,
    datetime timestamp,
    sma0060 decimal,
    sma0120 decimal,
    sma0240 decimal,
    PRIMARY KEY ((exchange, symbol, period), datetime)
)
WITH CLUSTERING ORDER BY (datetime ASC)
AND caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};

CREATE TABLE finance_prod.strategy (
    name ascii,
    description text,
    PRIMARY KEY (name)
)
WITH caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};

CREATE TABLE finance_prod.attention (
    exchange ascii,
    symbol ascii,
    period ascii,
    datetime timestamp,
    lsma text,
    PRIMARY KEY ((exchange, symbol, period), datetime)
)
WITH CLUSTERING ORDER BY (datetime ASC)
AND caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};
