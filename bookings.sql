

-- Table: booking
CREATE TABLE `booking` (
    `booking_id` int(11) NOT NULL PRIMARY KEY,
    `passenger_id` int(11) NOT NULL,
    `position` int(11) NOT NULL,
    `status_id` int(11) NOT NULL,
    `booking_date` date NOT NULL,
    `starting_station_id` int(11) NOT NULL,
    `ending_station_id` int(11) NOT NULL,
    `train_journey_id` int(11) NOT NULL,
    `ticket_class_id` int(11) NOT NULL,
    `amount_paid` decimal(10, 0) NOT NULL,
    `ticket_no` int(11) NOT NULL,
    `seat_no` int(11) NOT NULL,
    CONSTRAINT `fk_booking_passenger` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
    CONSTRAINT `fk_booking_status` FOREIGN KEY (`status_id`) REFERENCES `booking status` (`status_id`),
    CONSTRAINT `fk_booking_starting_station` FOREIGN KEY (`starting_station_id`) REFERENCES `train station` (`train_station_id`),
    CONSTRAINT `fk_booking_ending_station` FOREIGN KEY (`ending_station_id`) REFERENCES `train station` (`train_station_id`),
    CONSTRAINT `fk_booking_train_journey` FOREIGN KEY (`train_journey_id`) REFERENCES `train journey` (`train_journey_id`),
    CONSTRAINT `fk_booking_ticket_class` FOREIGN KEY (`ticket_class_id`) REFERENCES `carriage class` (`carriage_class_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: booking status
CREATE TABLE `booking status` (
    `status_id` int(11) NOT NULL PRIMARY KEY,
    `name` varchar(20) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: carriage class
CREATE TABLE `carriage class` (
    `carriage_class_id` int(11) NOT NULL PRIMARY KEY,
    `class_name` varchar(20) NOT NULL,
    `seating_capacity` int(11) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: carriage price
CREATE TABLE `carriage price` (
    `schedule_id` int(11) NOT NULL,
    `carriage_class_id` int(11) NOT NULL,
    `price` decimal(10, 0) NOT NULL,
    PRIMARY KEY (
        `schedule_id`,
        `carriage_class_id`
    ),
    CONSTRAINT `fk_carriage_price_schedule` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
    CONSTRAINT `fk_carriage_price_class` FOREIGN KEY (`carriage_class_id`) REFERENCES `carriage class` (`carriage_class_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: journey carriage
CREATE TABLE `journey carriage` (
    `journey_id` int(11) NOT NULL,
    `carriage_class_id` int(11) NOT NULL,
    `position` int(11) NOT NULL,
    PRIMARY KEY (
        `journey_id`,
        `carriage_class_id`
    ),
    CONSTRAINT `fk_journey_carriage_journey` FOREIGN KEY (`journey_id`) REFERENCES `train journey` (`train_journey_id`),
    CONSTRAINT `fk_journey_carriage_class` FOREIGN KEY (`carriage_class_id`) REFERENCES `carriage class` (`carriage_class_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: journey station
CREATE TABLE `journey station` (
    `journey_id` int(11) NOT NULL,
    `station_id` int(11) NOT NULL,
    `stop_order` int(11) NOT NULL,
    `departure_time` datetime NOT NULL,
    PRIMARY KEY (`journey_id`, `station_id`),
    CONSTRAINT `fk_journey_station_journey` FOREIGN KEY (`journey_id`) REFERENCES `train journey` (`train_journey_id`),
    CONSTRAINT `fk_journey_station_station` FOREIGN KEY (`station_id`) REFERENCES `train station` (`train_station_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE

-- Table: passenger
CREATE TABLE `passenger` (
    `passenger_id` int(11) NOT NULL PRIMARY KEY,
    `first_name` varchar(20) NOT NULL,
    `last_name` varchar(20) NOT NULL,
    `email_address` varchar(50) NOT NULL,
    `password` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: schedule
CREATE TABLE `schedule` (
    `schedule_id` int(11) NOT NULL PRIMARY KEY,
    `train_id` int(11) NOT NULL,
    `departure_date` date NOT NULL,
    `departure_time` time NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: train journey
CREATE TABLE `train journey` (
    `train_journey_id` int(11) NOT NULL PRIMARY KEY,
    `schedule_id` int(11) NOT NULL,
    `name` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

-- Table: train station
CREATE TABLE `train station` (
    `train_station_id` int(11) NOT NULL PRIMARY KEY,
    `station_name` varchar(20) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `train journey` (
        `train_journey_id`,
        `schedule_id`,
        `name`
    )
VALUES (
        '1',
        '1',
        '1:00PM Mountain View Junction to Savannah Central'
    ),
    (
        '2',
        '2',
        '2:00PM Mountain View Junction to Savannah Central'
    ),
    (
        '3',
        '3',
        '12:00PM Coastal Breeze Terminal to Highlands Stations'
    ),
    (
        '4',
        '4',
        '9:12AM Lakeview Crossroads to Savannah Terminal'
    ),
    (
        '5',
        '5',
        '6:00PM Mountain View Junction to Lakeview Crossroads'
    );

INSERT INTO
    `journey station` (
        `journey_id`,
        `station_id`,
        `stop_order`,
        `departure_time`
    )
VALUES (
        '1',
        '1',
        '1',
        '2025-01-12 13:50:13.000000'
    ),
    (
        '2',
        '2',
        '2',
        '2025-01-12 13:50:13.000000'
    ),
    (
        '3',
        '3',
        '3',
        '2025-01-12 13:50:13.000000'
    ),
    (
        '4',
        '4',
        '4',
        '2025-01-12 13:50:13.000000'
    ),
    (
        '5',
        '5',
        '5',
        '2025-01-12 13:50:13.000000'
    );

INSERT INTO
    `carriage class` (
        `carriage_class_id`,
        `class_name`,
        `seating_capacity`
    )
VALUES ('1', 'Madaraka Elite', '30'),
    ('2', 'Coastal Comfort', '45'),
    ('3', 'Riftvalley View', '80'),
    (
        '4',
        'Savannah Explorer',
        '180'
    ),
    (
        '5',
        'L.Victoria Class',
        '210'
    );

INSERT INTO
    `journey carriage` (
        `journey_id`,
        `carriage_class_id`,
        `position`
    )
VALUES ('1', '1', '10'),
    ('2', '2', '15'),
    ('3', '3', '20'),
    ('4', '4', '25'),
    ('5', '5', '30');

INSERT INTO
    `carriage price` (
        `schedule_id`,
        `carriage_class_id`,
        `price`
    )
VALUES ('1', '1', '4500'),
    ('2', '2', '3723'),
    ('3', '3', '3000'),
    ('4', '4', '2500'),
    ('5', '5', '2000');

INSERT INTO
    `passenger` (
        `passenger_id`,
        `first_name`,
        `last_name`,
        `email_address`,
        `password`
    )
VALUES (
        '6',
        'James',
        'Ochieng',
        'jameso@gmail.com',
        'Ojames@gmail.com'
    ),
    (
        '7',
        'Grace',
        'Wanjiru',
        'gracew@gmail.com',
        'Wgrace@gmail.com'
    ),
    (
        '8',
        'Brian',
        'Kiprotich',
        'briank@gmail.com',
        'Kbrian@gmail.com'
    ),
    (
        '9',
        'Lucy',
        'Kamau',
        'lucyk@gmail.com',
        'Klucy@gmail.com'
    ),
    (
        '10',
        'David',
        'Nyongesa',
        'davidn@gmail.com',
        'Ndavid@gmail.com'
    );

INSERT INTO
    `booking` (
        `booking_id`,
        `passenger_id`,
        `position`,
        `status_id`,
        `booking_date`,
        `starting_station_id`,
        `ending_station_id`,
        `train_journey_id`,
        `ticket_class_id`,
        `amount_paid`,
        `ticket_no`,
        `seat_no`
    )
VALUES (
        '2',
        '2',
        '5',
        '1',
        '2025-01-08',
        '2',
        '3',
        '2',
        '2',
        '4000',
        '4',
        '13'
    ),
    (
        '3',
        '3',
        '5',
        '1',
        '2025-01-08',
        '3',
        '4',
        '3',
        '3',
        '3500',
        '33 ',
        '2'
    ),
    (
        '4',
        '4',
        '21',
        '3',
        '2025-01-11',
        '4',
        '5',
        '4',
        '4',
        '2300',
        '6',
        '7'
    ),
    (
        '5',
        '5',
        '5',
        '4',
        '2025-01-08',
        '5',
        '1',
        '5',
        '5',
        '2000',
        '43',
        '9'
    ),
    (
        '6',
        '6',
        '8',
        '4',
        '2025-01-08',
        '4',
        '2',
        '3',
        '4',
        '3000',
        '43',
        '8'
    );

INSERT INTO
    `booking status` (`status_id`, `name`)
VALUES ('1', 'Confirmed'),
    ('2', 'Pending'),
    ('3', 'Cancelled'),
    ('4', 'Completed') ('5', 'Failed');

INSERT INTO
    `schedule` (
        `schedule_id`,
        `train_id`,
        `departure_date`,
        `departure_time`
    )
VALUES (
        '1',
        '1',
        '2025-01-12',
        '13:00:00'
    ),
    (
        '2',
        '2',
        '2025-01-12',
        '14:00:00'
    ),
    (
        '3',
        '3',
        '2025-01-12',
        '12:00:00'
    ),
    (
        '4',
        '4',
        '2025-01-12',
        '09:12:00'
    ),
    (
        '5',
        '5',
        '2025-01-12',
        '18:00:00'
    );

INSERT INTO
    `train station` (
        `train_station_id`,
        `station_name`
    )
VALUES ('1', 'Mountain View Junction'),
    ('2', 'Savannah Central'),
    (
        '3',
        'Coastal Breeze Terminal'
    ),
    ('4', 'Highlands Stations'),
    ('5', 'Lakeview Crossroads'),
    ('6', 'Savannah Terminal');
