-- Create the database
CREATE DATABASE CsmDB;
GO

-- Use the newly created database
USE CsmDB;
GO

-- Create the Users table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) NOT NULL,
    UserName NVARCHAR(50) NULL,
    Email NVARCHAR(50) NULL,
    PRIMARY KEY (UserID)
);
GO

-- Insert sample data into Users table
INSERT INTO Users (UserName, Email) VALUES (N'John Doe', N'john.doe@example.com');
GO
INSERT INTO Users (UserName, Email) VALUES (N'Jane Smith', N'jane.smith@example.com');
GO
INSERT INTO Users (UserName, Email) VALUES (N'Alice Johnson', N'alice.johnson@example.com');
GO
