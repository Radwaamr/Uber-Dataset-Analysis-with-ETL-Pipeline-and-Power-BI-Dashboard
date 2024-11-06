BULK INSERT dropoff_datetime_dim
FROM "D:\Uber Project\dropoff_datetime_dim.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);


BULK INSERT pickup_datetime_dim
FROM "D:\Uber Project\pickup_datetime_dim.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT pickup_location_dim
FROM "D:\Uber Project\pickup_location_dim.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);


BULK INSERT dropoff_location_dim
FROM "D:\Uber Project\dropoff_location_dim.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT payment_type_dim
FROM "D:\Uber Project\payment_type_dim.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);


BULK INSERT rate_code_dim
FROM "D:\Uber Project\rate_code_dim.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

BULK INSERT fact_table
FROM "D:\Uber Project\fact_table.csv"
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);