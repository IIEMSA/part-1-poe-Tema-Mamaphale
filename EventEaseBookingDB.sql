-- Drop existing tables in the correct order
DROP TABLE IF EXISTS Booking;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Venue;

-- Create Venue table
CREATE TABLE Venue (
    VenueId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    VenueName VARCHAR(100) NOT NULL,
    Location VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    ImageUrl VARCHAR(MAX)
);

-- Create Event table
CREATE TABLE Event (
    EventId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EventName VARCHAR(100) NOT NULL,
    EventDate DATE NOT NULL,
    Description VARCHAR(MAX),
    VenueId INT NOT NULL,
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId)
);

-- Create Booking table
CREATE TABLE Booking (
    BookingId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    EventId INT NOT NULL,
    VenueId INT NOT NULL,
    BookingDate DATE NOT NULL,
    FOREIGN KEY (EventId) REFERENCES Event(EventId),
    FOREIGN KEY (VenueId) REFERENCES Venue(VenueId)
);

-- Insert venues
INSERT INTO Venue (VenueName, Location, Capacity, ImageUrl) VALUES
('Big Orchid', 'Knysna', 500, 'bigorchid.jpg'),
('Lotus Lake', 'Umhlanga', 600, 'lotuslake.jpg'),
('The Boardwalk Venue', 'Cape Town', 800, 'theboardwalkvenue.jpg');

-- Insert events using correct data
INSERT INTO Event (EventName, EventDate, Description, VenueId) VALUES
('Vowel Renewal', '2025-09-24', 'Celebration of lasting love', 1),
('Wedding', '2025-10-02', 'Formal wedding event', 1),
('Shareholders Conference', '2025-04-06', 'Annual business meeting', 3);

-- Insert bookings
INSERT INTO Booking (EventId, VenueId, BookingDate) VALUES
(2, 1, '2025-08-28'),
(1, 2, '2025-11-15'),
(2, 1, '2025-05-20');

-- View the results
SELECT * FROM Venue;
SELECT * FROM Event;
SELECT * FROM Booking;


