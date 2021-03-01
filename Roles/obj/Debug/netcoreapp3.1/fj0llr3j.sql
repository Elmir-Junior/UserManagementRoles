CREATE TABLE IF NOT EXISTS `__EFMigrationsHistory` (
    `MigrationId` varchar(95) NOT NULL,
    `ProductVersion` varchar(32) NOT NULL,
    CONSTRAINT `PK___EFMigrationsHistory` PRIMARY KEY (`MigrationId`)
);

CREATE TABLE `AspNetRoles` (
    `Id` nvarchar(450) NOT NULL,
    `Name` nvarchar(256) NULL,
    `NormalizedName` nvarchar(256) NULL,
    `ConcurrencyStamp` nvarchar(max) NULL,
    CONSTRAINT `PK_AspNetRoles` PRIMARY KEY (`Id`)
);

CREATE TABLE `AspNetUsers` (
    `Id` nvarchar(450) NOT NULL,
    `UserName` nvarchar(256) NULL,
    `NormalizedUserName` nvarchar(256) NULL,
    `Email` nvarchar(256) NULL,
    `NormalizedEmail` nvarchar(256) NULL,
    `EmailConfirmed` bit NOT NULL,
    `PasswordHash` nvarchar(max) NULL,
    `SecurityStamp` nvarchar(max) NULL,
    `ConcurrencyStamp` nvarchar(max) NULL,
    `PhoneNumber` nvarchar(max) NULL,
    `PhoneNumberConfirmed` bit NOT NULL,
    `TwoFactorEnabled` bit NOT NULL,
    `LockoutEnd` datetimeoffset(6) NULL,
    `LockoutEnabled` bit NOT NULL,
    `AccessFailedCount` int NOT NULL,
    CONSTRAINT `PK_AspNetUsers` PRIMARY KEY (`Id`)
);

CREATE TABLE `AspNetRoleClaims` (
    `Id` int NOT NULL,
    `RoleId` nvarchar(450) NOT NULL,
    `ClaimType` nvarchar(max) NULL,
    `ClaimValue` nvarchar(max) NULL,
    CONSTRAINT `PK_AspNetRoleClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserClaims` (
    `Id` int NOT NULL,
    `UserId` nvarchar(450) NOT NULL,
    `ClaimType` nvarchar(max) NULL,
    `ClaimValue` nvarchar(max) NULL,
    CONSTRAINT `PK_AspNetUserClaims` PRIMARY KEY (`Id`),
    CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserLogins` (
    `LoginProvider` nvarchar(128) NOT NULL,
    `ProviderKey` nvarchar(128) NOT NULL,
    `ProviderDisplayName` nvarchar(max) NULL,
    `UserId` nvarchar(450) NOT NULL,
    CONSTRAINT `PK_AspNetUserLogins` PRIMARY KEY (`LoginProvider`, `ProviderKey`),
    CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserRoles` (
    `UserId` nvarchar(450) NOT NULL,
    `RoleId` nvarchar(450) NOT NULL,
    CONSTRAINT `PK_AspNetUserRoles` PRIMARY KEY (`UserId`, `RoleId`),
    CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
    CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `AspNetUserTokens` (
    `UserId` nvarchar(450) NOT NULL,
    `LoginProvider` nvarchar(128) NOT NULL,
    `Name` nvarchar(128) NOT NULL,
    `Value` nvarchar(max) NULL,
    CONSTRAINT `PK_AspNetUserTokens` PRIMARY KEY (`UserId`, `LoginProvider`, `Name`),
    CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
);

CREATE INDEX `IX_AspNetRoleClaims_RoleId` ON `AspNetRoleClaims` (`RoleId`);

CREATE UNIQUE INDEX `RoleNameIndex` ON `AspNetRoles` (`NormalizedName`);

CREATE INDEX `IX_AspNetUserClaims_UserId` ON `AspNetUserClaims` (`UserId`);

CREATE INDEX `IX_AspNetUserLogins_UserId` ON `AspNetUserLogins` (`UserId`);

CREATE INDEX `IX_AspNetUserRoles_RoleId` ON `AspNetUserRoles` (`RoleId`);

CREATE INDEX `EmailIndex` ON `AspNetUsers` (`NormalizedEmail`);

CREATE UNIQUE INDEX `UserNameIndex` ON `AspNetUsers` (`NormalizedUserName`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('00000000000000_CreateIdentitySchema', '3.1.12');

ALTER TABLE `AspNetUsers` DROP INDEX `UserNameIndex`;

ALTER TABLE `AspNetRoles` DROP INDEX `RoleNameIndex`;

ALTER TABLE `AspNetUserTokens` MODIFY COLUMN `Value` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUserTokens` MODIFY COLUMN `Name` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserTokens` MODIFY COLUMN `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserTokens` MODIFY COLUMN `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `UserName` varchar(256) CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `TwoFactorEnabled` tinyint(1) NOT NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `SecurityStamp` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `PhoneNumberConfirmed` tinyint(1) NOT NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `PhoneNumber` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `PasswordHash` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `LockoutEnd` datetime(6) NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `LockoutEnabled` tinyint(1) NOT NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `EmailConfirmed` tinyint(1) NOT NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `Email` varchar(256) CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` MODIFY COLUMN `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUsers` ADD `FirstName` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` ADD `LastName` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUsers` ADD `ProfilePicture` longblob NULL;

ALTER TABLE `AspNetUsers` ADD `UsernameChangeLimit` int NOT NULL DEFAULT 0;

ALTER TABLE `AspNetUserRoles` MODIFY COLUMN `RoleId` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserRoles` MODIFY COLUMN `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserLogins` MODIFY COLUMN `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserLogins` MODIFY COLUMN `ProviderDisplayName` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUserLogins` MODIFY COLUMN `ProviderKey` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserLogins` MODIFY COLUMN `LoginProvider` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserClaims` MODIFY COLUMN `UserId` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetUserClaims` MODIFY COLUMN `ClaimValue` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetUserClaims` MODIFY COLUMN `ClaimType` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetRoles` MODIFY COLUMN `NormalizedName` varchar(256) CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetRoles` MODIFY COLUMN `Name` varchar(256) CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetRoles` MODIFY COLUMN `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetRoles` MODIFY COLUMN `Id` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetRoleClaims` MODIFY COLUMN `RoleId` varchar(255) CHARACTER SET utf8mb4 NOT NULL;

ALTER TABLE `AspNetRoleClaims` MODIFY COLUMN `ClaimValue` longtext CHARACTER SET utf8mb4 NULL;

ALTER TABLE `AspNetRoleClaims` MODIFY COLUMN `ClaimType` longtext CHARACTER SET utf8mb4 NULL;

CREATE UNIQUE INDEX `UserNameIndex` ON `AspNetUsers` (`NormalizedUserName`);

CREATE UNIQUE INDEX `RoleNameIndex` ON `AspNetRoles` (`NormalizedName`);

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`)
VALUES ('20210226133517_custom', '3.1.12');

