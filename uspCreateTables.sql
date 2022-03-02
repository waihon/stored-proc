CREATE PROCEDURE uspCreateTables
AS
START
    CREATE TABLE sales.persons
    (
        person_id INT PRIMARY KEY IDENTITY,
        first_name NVARCHAR(100) NOT NULL,
        last_name NVARCHAR(100) NOT NULL
    );

    CREATE table sales.deals
    (
        deal_id INT PRIMARY KEY IDENTITY,
        person_id INT NOT NULL,
        deal_note NVARCHAR(100),
        FOREIGN KEY(person_id) REFERENCES sales.persons(person_id)
    );

    INSERT INTO
        sales.persons(first_name, last_name)
    VALUES
        ('John', 'Doe'),
        ('Mary', 'Jane');

    INSERT INTO
        sales.deals(person_id, deal_note)
    VALUES
        (1, 'Deal for John Doe');
END;
GO
