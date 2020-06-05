drop database tracking;
create database tracking;

    use tracking;

        create table  `users` (
                `userid` int AUTO_INCREMENT,
                `username`  varchar(25),
                `phonenumber` varchar(16),
                `dateregister` timestamp default CURRENT_TIMESTAMP,
                PRIMARY key (`userid`)
        );

          describe `users`;

        create table `userfinder` (
                `userid` int,
                `findbyuserid` int,
                FOREIGN KEY (`userid`) REFERENCES Users (`userid`),
                FOREIGN KEY(`findbyuserid`) REFERENCES Users (`userid`),
        );
 
          describe `userfinder`;

        create table `places` (
                `placename` varchar(50),
                `placelog` double,
                `placelat` double,
                `notifyme` boolean default 1,
                `placefulllocation` varchar (70),
                `userid` int,
                FOREIGN KEY(`userid`) REFERENCES Users (`userid`),

        );
 
          describe `places`;

        create table `notification` (
                `userid` int,
                `byuserid` int,
                `placefulllocation` varchar(70),
                `isreaded` boolean default 0,
                FOREIGN KEY(`userid`) REFERENCES Users (`userid`),
                FOREIGN KEY(`byuserid`) REFERENCES Users (`userid`),
        );

          describe  `notification`;

        create table `tracking` (
                `userid` int,
                `log` double,
                `lat` double,
                `batterylevel` int,
                `datecheckin` timestamp default current_timestamp,

                FOREIGN KEY(`userid`) REFERENCES Users (`userid`),

        );
 
          describe `tracking`;
          
       create table `shopitems` (
                  `itemname` varchar(70),
                  `preferpalce` varchar (70),
                  `requestedbyuserid` int,
                  `deliveredbyuserid` int,
                  `daterequested`  timestamp default current_timestamp, 
                  `datedelivered`  datetime,
                  FOREIGN KEY(`requestedbyuserid`) REFERENCES Users (`userid`),
                  FOREIGN KEY(`deliveredbyuserid`) REFERENCES Users (`userid`),
              
        );
          
          describe `shopitems`;