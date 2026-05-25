
CREATE TABLE Factory (
    factoryId VARCHAR2(10) PRIMARY KEY,
    factoryName VARCHAR2(100) NOT NULL,
    location VARCHAR2(100),
    factoryType VARCHAR2(50),
    operationalStatus VARCHAR2(20)
);

CREATE TABLE ProductionLine (
    productionLineId VARCHAR2(10) PRIMARY KEY,
    factoryId VARCHAR2(10),
    lineName VARCHAR2(100),
    lineStatus VARCHAR2(20),
    supervisorName VARCHAR2(100),
    CONSTRAINT fk_factory
        FOREIGN KEY (factoryId)
        REFERENCES Factory(factoryId)
);

CREATE TABLE ProductionBatch (
    batchId VARCHAR2(10) PRIMARY KEY,
    productionLineId VARCHAR2(10),
    productionQuantity NUMBER,
    productionDate DATE,
    batchStatus VARCHAR2(20),
    CONSTRAINT fk_line
        FOREIGN KEY (productionLineId)
        REFERENCES ProductionLine(productionLineId)
);

CREATE TABLE QualityInspection (
    inspectionId VARCHAR2(10) PRIMARY KEY,
    batchId VARCHAR2(10),
    defectCount NUMBER,
    inspectionDate DATE,
    inspectionStatus VARCHAR2(20),
    CONSTRAINT fk_batch
        FOREIGN KEY (batchId)
        REFERENCES ProductionBatch(batchId)
);


CREATE TABLE ProductionAlert (
    alertId VARCHAR2(10) PRIMARY KEY,
    batchId VARCHAR2(10) NOT NULL,
    alertReason VARCHAR2(200),
    alertSeverity VARCHAR2(20),
    alertStatus VARCHAR2(20),

    CONSTRAINT fk_alert_batch
    FOREIGN KEY (batchId)
    REFERENCES ProductionBatch(batchId)

);

CREATE TABLE Reject_ProductionBatch (
    batchId VARCHAR2(10),
    productionLineId VARCHAR2(10),
    productionQuantity NUMBER,
    productionDate VARCHAR2(20),
    batchStatus VARCHAR2(20),
    rejectReason VARCHAR2(100)
);

CREATE TABLE Reject_QualityInspection (
    inspectionId VARCHAR2(10),
    batchId VARCHAR2(10),
    defectCount NUMBER,
    inspectionDate DATE,
    inspectionStatus VARCHAR2(20),
    rejectReason VARCHAR2(200),
    rejectDate DATE DEFAULT SYSDATE
);