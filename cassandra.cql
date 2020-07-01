
CREATE KEYSPACE finance_prod
WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
};

USE finance_prod;

CREATE TABLE setting (
    name ascii,
    value ascii,
    PRIMARY KEY (name)
)
WITH caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};

CREATE TABLE record (
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

CREATE TABLE indicator (
    exchange ascii,
    symbol ascii,
    period ascii,
    datetime timestamp,
    name text,
    sma0005 decimal,
    sma0010 decimal,
    sma0020 decimal,
    sma0060 decimal,
    sma0120 decimal,
    sma0240 decimal,
    PRIMARY KEY ((exchange, symbol, period), datetime)
)
WITH CLUSTERING ORDER BY (datetime ASC)
AND caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};

CREATE TABLE strategy (
    exchange ascii,
    symbol ascii,
    period ascii,
    datetime timestamp,
    name text,
    ssma text,
    lsma text,
    PRIMARY KEY ((exchange, symbol, period), datetime)
)
WITH CLUSTERING ORDER BY (datetime ASC)
AND caching = {'keys' : 'NONE', 'rows_per_partition' : 'NONE'};
