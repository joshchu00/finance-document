
CREATE KEYSPACE finance
WITH REPLICATION = {
    'class' : 'SimpleStrategy',
    'replication_factor' : 1
};

CREATE TABLE StockRecord (
    datetime timestamp,
    unit duration,
    symbol ascii,
    name text,
    volumn bigint,
    transaction bigint,
    value bigint,
    open double,
    high double,
    low double,
    close double,
    change double,
    lastBidPrice double,
    lastBidVolume bigint,
    lastAskPrice double,
    lastAskVolume bigint,
    PRIMARY KEY ((datetime, unit, symbol))
) WITH caching={'keys':'NONE','rows_per_partition':'NONE'};

CREATE TABLE OptionRecord (
    datetime timestamp,
    contract ascii,
    contractMonth ascii,
    strikePrice ascii,
    callPut ascii,
    open double,
    high double,
    low double,
    close double,
    settlementPrice double,
    change double,
    percent double,
    volumnAfterHours bigint,
    volumnRegular bigint,
    volumnTotal bigint,
    openInterest bigint,
    bestBid double,
    bestAsk double,
    historicalHigh double,
    historicalLow double,
    PRIMARY KEY ((datetime, contract, contractMonth), strikePrice, callPut)
) WITH caching={'keys':'NONE','rows_per_partition':'NONE'};




