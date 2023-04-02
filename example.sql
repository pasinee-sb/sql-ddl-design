DROP DATABASE IF EXISTS school_db;
CREATE DATABASE school_db;
\c school_db



CREATE TABLE `Student` (
    `StudentID` int  NOT NULL ,
    `Name` varchar(30)  NOT NULL ,
    `DepartmentID` int  NOT NULL ,
    `Adress` varchar(50)  NOT NULL ,
    `DateOfBirth` date  NOT NULL ,
    PRIMARY KEY (
        `StudentID`
    )
);

CREATE TABLE `Course` (
    `CourseID` int  NOT NULL ,
    `StudentID` int  NOT NULL ,
    `LessonID` int  NOT NULL ,
    `Description` varchar(50)  NOT NULL ,
    `StartDate` date  NOT NULL ,
    `EndDate` date  NOT NULL ,
    PRIMARY KEY (
        `CourseID`
    )
);

CREATE TABLE `Lesson` (
    `LessonID` int  NOT NULL ,
    `Description` varchar(30)  NOT NULL ,
    `TutorID` int  NOT NULL ,
    PRIMARY KEY (
        `LessonID`
    )
);

CREATE TABLE `Tutor` (
    `TutorID` int  NOT NULL ,
    `Name` varchar(30)  NOT NULL ,
    `Title` varchar(30)  NOT NULL ,
    PRIMARY KEY (
        `TutorID`
    )
);

ALTER TABLE `Course` ADD CONSTRAINT `fk_Course_StudentID` FOREIGN KEY(`StudentID`)
REFERENCES `Student` (`StudentID`);

ALTER TABLE `Course` ADD CONSTRAINT `fk_Course_LessonID` FOREIGN KEY(`LessonID`)
REFERENCES `Lesson` (`LessonID`);

ALTER TABLE `Lesson` ADD CONSTRAINT `fk_Lesson_TutorID` FOREIGN KEY(`TutorID`)
REFERENCES `Tutor` (`TutorID`);