-- BroadcastDateテーブル
CREATE TABLE BroadcastDate (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL
);

-- StartTimeテーブル
CREATE TABLE StartTime (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Time TIME NOT NULL  -- 時間のみを格納
);

-- EndTimeテーブル
CREATE TABLE EndTime (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Time TIME NOT NULL  -- 時間のみを格納
);

-- VideoTimeテーブル
CREATE TABLE VideoTime (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Duration INT NOT NULL  -- 動画の長さ（分）を格納
);

-- Genreテーブル
CREATE TABLE Genre (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(100) NOT NULL
);

-- Channelテーブル
CREATE TABLE Channel (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ChannelName VARCHAR(255) NOT NULL
);

-- Titleテーブル
CREATE TABLE Title (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TitleName VARCHAR(255) NOT NULL,
    Detail VARCHAR(255),
    VideoTimeID INT,
    BroadcastDateID INT,
    StartTimeID INT,
    EndTimeID INT,
    GenreID INT,
    FOREIGN KEY (VideoTimeID) REFERENCES VideoTime(ID),
    FOREIGN KEY (BroadcastDateID) REFERENCES BroadcastDate(ID),
    FOREIGN KEY (StartTimeID) REFERENCES StartTime(ID),
    FOREIGN KEY (EndTimeID) REFERENCES EndTime(ID),
    FOREIGN KEY (GenreID) REFERENCES Genre(ID)
);

-- ViewCountテーブル
CREATE TABLE ViewCount (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TitleID INT,
    ChannelID INT,
    ViewCount INT,
    FOREIGN KEY (TitleID) REFERENCES Title(ID),
    FOREIGN KEY (ChannelID) REFERENCES Channel(ID)
);

-- Seasonテーブル
CREATE TABLE Season (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SeasonNumber INT NOT NULL,
    TitleID INT,
    FOREIGN KEY (TitleID) REFERENCES Title(ID)
);

-- Episodeテーブル
CREATE TABLE Episode (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    EpisodeNumber INT NOT NULL,
    TitleID INT,
    FOREIGN KEY (TitleID) REFERENCES Title(ID)
);

-- SpecialProgramテーブル
CREATE TABLE SpecialProgram (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    TitleID INT,
    FOREIGN KEY (TitleID) REFERENCES Title(ID)
);
