USE [gamedb];

ALTER TABLE gamedb.dbo.guild add bank varchar(8000);

alter table gamedb.dbo.guild add gold bigint default(0) NOT NULL;

alter table gamedb.dbo.character drop constraint DF_character_guild_permission;
alter table gamedb.dbo.character alter column guild_permission bigint;
ALTER TABLE gamedb.dbo.character ADD CONSTRAINT DF_character_guild_permission DEFAULT 0 FOR guild_permission;

alter table gamedb.dbo.guild add 
PDEF int default(0) NOT NULL,
MSPD int default(0) NOT NULL,
ASPD int default(0) NOT NULL,
MXATK int default(0) NOT NULL,
DEF  int default(0) NOT NULL,
HIT  int default(0) NOT NULL,
FLEE int default(0) NOT NULL,
HREC int default(0) NOT NULL,
SREC int default(0) NOT NULL,
MXHP int default(0) NOT NULL,
MXSP int default(0) NOT NULL,
level int default(0) NOT NULL;

alter table gamedb.dbo.guild add colour int default(-1) NOT NULL;
alter table gamedb.dbo.guild add icon int default(0) NOT NULL;

CREATE TABLE holding
( 
  id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
  bag VARCHAR(8000) NOT NULL,
);

alter table gamedb.dbo.account add IMP int default(0);

alter table gamedb.dbo.character add chatColour int default(-1) NOT NULL