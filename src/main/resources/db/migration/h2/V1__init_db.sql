--
-- The MIT License (MIT)
--
-- Copyright (C) 2013-2016 tarent solutions GmbH
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--

;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_ADDD6050_0631_4202_81EC_5203699C2E72 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0B092FFB_BF7D_47F3_827F_431B6AF6A244 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_F7E33F06_F333_434A_878B_6883B2433338 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_35A80218_0098_4BCE_A7B6_634A29DC47D6 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_7F9F2004_93D7_4066_9E97_48C3FBFB4579 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E8417323_0F46_4A2A_8DD4_C62A9F3F4521 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E80DF453_7A86_4826_B418_9A7152AACC3B START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E34F7D10_8A51_4DB5_8019_15B7A186C043 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_6ABDB1ED_A524_44DF_B178_98BBD6CA2FBB START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A40B0E8D_9340_4521_8B56_BA22FFDA35D2 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_56784048_148B_4B1F_BFA9_E24C9AF89002 START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_34502B75_E8F8_4BEC_B19E_273EB31017BF START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_5E8B313F_C0B1_4541_AD79_72B80F1497BE START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_5192A703_5F46_4A23_8E65_B79FACF6112C START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_3190B111_ABD4_4471_8E16_0A2D986B00EF START WITH 1 BELONGS_TO_TABLE;
CREATE CACHED TABLE PUBLIC.OSIAM_CLIENT(
    INTERNAL_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_ADDD6050_0631_4202_81EC_5203699C2E72) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_ADDD6050_0631_4202_81EC_5203699C2E72,
    ACCESS_TOKEN_VALIDITY_SECONDS INTEGER NOT NULL,
    CLIENT_SECRET VARCHAR(255) NOT NULL,
    ID VARCHAR(32) NOT NULL,
    IMPLICIT_APPROVAL BOOLEAN NOT NULL,
    REDIRECT_URI CLOB NOT NULL,
    REFRESH_TOKEN_VALIDITY_SECONDS INTEGER NOT NULL,
    VALIDITY_IN_SECONDS BIGINT NOT NULL
);
ALTER TABLE PUBLIC.OSIAM_CLIENT ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.OSIAM_CLIENT;
CREATE CACHED TABLE PUBLIC.OSIAM_CLIENT_GRANTS(
    ID BIGINT NOT NULL,
    GRANTS VARCHAR(255)
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.OSIAM_CLIENT_GRANTS;
CREATE CACHED TABLE PUBLIC.OSIAM_CLIENT_SCOPES(
    ID BIGINT NOT NULL,
    SCOPE VARCHAR(255)
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.OSIAM_CLIENT_SCOPES;
CREATE CACHED TABLE PUBLIC.SCIM_ADDRESS(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_6ABDB1ED_A524_44DF_B178_98BBD6CA2FBB) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_6ABDB1ED_A524_44DF_B178_98BBD6CA2FBB,
    IS_PRIMARY BOOLEAN,
    COUNTRY VARCHAR(255),
    FORMATTED CLOB,
    LOCALITY VARCHAR(255),
    POSTAL_CODE VARCHAR(255),
    REGION VARCHAR(255),
    STREET_ADDRESS VARCHAR(255),
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_ADDRESS ADD CONSTRAINT PUBLIC.CONSTRAINT_2 PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_ADDRESS;
CREATE INDEX PUBLIC.UK_IE5406DJ1T9I0F9HYTGVBXJL2 ON PUBLIC.SCIM_ADDRESS(TYPE);
CREATE INDEX PUBLIC.UK_4JV7NLHVKA8R583HODB6Q7WNR ON PUBLIC.SCIM_ADDRESS(COUNTRY, REGION, LOCALITY, POSTAL_CODE, STREET_ADDRESS);
CREATE CACHED TABLE PUBLIC.SCIM_CERTIFICATE(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_34502B75_E8F8_4BEC_B19E_273EB31017BF) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_34502B75_E8F8_4BEC_B19E_273EB31017BF,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_CERTIFICATE ADD CONSTRAINT PUBLIC.CONSTRAINT_9 PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_CERTIFICATE;
CREATE INDEX PUBLIC.UK_7K7TC0DU5JUCY4RANQN8UID4B ON PUBLIC.SCIM_CERTIFICATE(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_EMAIL(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E8417323_0F46_4A2A_8DD4_C62A9F3F4521) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E8417323_0F46_4A2A_8DD4_C62A9F3F4521,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_EMAIL ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_EMAIL;
CREATE INDEX PUBLIC.UK_HVPIETO01A5C7B5EDR1V9POM4 ON PUBLIC.SCIM_EMAIL(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_ENTITLEMENTS(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_F7E33F06_F333_434A_878B_6883B2433338) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_F7E33F06_F333_434A_878B_6883B2433338,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_ENTITLEMENTS ADD CONSTRAINT PUBLIC.CONSTRAINT_6 PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_ENTITLEMENTS;
CREATE INDEX PUBLIC.UK_75WO1PHHOVP2NBRUH2DMFHCWK ON PUBLIC.SCIM_ENTITLEMENTS(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_EXTENSION(
    INTERNAL_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_5192A703_5F46_4A23_8E65_B79FACF6112C) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_5192A703_5F46_4A23_8E65_B79FACF6112C,
    URN CLOB NOT NULL
);
ALTER TABLE PUBLIC.SCIM_EXTENSION ADD CONSTRAINT PUBLIC.CONSTRAINT_C PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_EXTENSION;
CREATE CACHED TABLE PUBLIC.SCIM_EXTENSION_FIELD(
    INTERNAL_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_0B092FFB_BF7D_47F3_827F_431B6AF6A244) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_0B092FFB_BF7D_47F3_827F_431B6AF6A244,
    NAME VARCHAR(255),
    REQUIRED BOOLEAN NOT NULL,
    TYPE VARCHAR(255) NOT NULL,
    EXTENSION BIGINT
);
ALTER TABLE PUBLIC.SCIM_EXTENSION_FIELD ADD CONSTRAINT PUBLIC.CONSTRAINT_D PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_EXTENSION_FIELD;
CREATE CACHED TABLE PUBLIC.SCIM_EXTENSION_FIELD_VALUE(
    INTERNAL_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_7F9F2004_93D7_4066_9E97_48C3FBFB4579) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_7F9F2004_93D7_4066_9E97_48C3FBFB4579,
    VALUE CLOB NOT NULL,
    EXTENSION_FIELD BIGINT NOT NULL,
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_EXTENSION_FIELD_VALUE ADD CONSTRAINT PUBLIC.CONSTRAINT_37 PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_EXTENSION_FIELD_VALUE;
CREATE INDEX PUBLIC.UK_F51QDSJK215O1WHU8YUQIL9X0 ON PUBLIC.SCIM_EXTENSION_FIELD_VALUE(USER_INTERNAL_ID, EXTENSION_FIELD);
CREATE CACHED TABLE PUBLIC.SCIM_GROUP(
    DISPLAY_NAME VARCHAR(255) NOT NULL,
    INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_GROUP ADD CONSTRAINT PUBLIC.CONSTRAINT_30 PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_GROUP;
CREATE CACHED TABLE PUBLIC.SCIM_GROUP_MEMBERS(
    GROUPS BIGINT NOT NULL,
    MEMBERS BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_GROUP_MEMBERS ADD CONSTRAINT PUBLIC.CONSTRAINT_F PRIMARY KEY(GROUPS, MEMBERS);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_GROUP_MEMBERS;
CREATE CACHED TABLE PUBLIC.SCIM_ID(
    INTERNAL_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_3190B111_ABD4_4471_8E16_0A2D986B00EF) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_3190B111_ABD4_4471_8E16_0A2D986B00EF,
    EXTERNAL_ID VARCHAR(255),
    ID VARCHAR(255) NOT NULL,
    META BIGINT
);
ALTER TABLE PUBLIC.SCIM_ID ADD CONSTRAINT PUBLIC.CONSTRAINT_9D PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_ID;
CREATE CACHED TABLE PUBLIC.SCIM_IM(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_35A80218_0098_4BCE_A7B6_634A29DC47D6) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_35A80218_0098_4BCE_A7B6_634A29DC47D6,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_IM ADD CONSTRAINT PUBLIC.CONSTRAINT_9D2 PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_IM;
CREATE INDEX PUBLIC.UK_88YYJ57G5NISGP2TRHS2YQA91 ON PUBLIC.SCIM_IM(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_META(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_A40B0E8D_9340_4521_8B56_BA22FFDA35D2) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A40B0E8D_9340_4521_8B56_BA22FFDA35D2,
    CREATED TIMESTAMP,
    LAST_MODIFIED TIMESTAMP,
    LOCATION CLOB,
    RESOURCE_TYPE VARCHAR(255),
    VERSION VARCHAR(255)
);
ALTER TABLE PUBLIC.SCIM_META ADD CONSTRAINT PUBLIC.CONSTRAINT_E PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_META;
CREATE INDEX PUBLIC.UK_1O8KEVC2E2HFK24F19J3VCIA4 ON PUBLIC.SCIM_META(CREATED);
CREATE INDEX PUBLIC.UK_3OWU6IBJVA850UT4E64P00XI5 ON PUBLIC.SCIM_META(LAST_MODIFIED);
CREATE CACHED TABLE PUBLIC.SCIM_NAME(
    ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_56784048_148B_4B1F_BFA9_E24C9AF89002) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_56784048_148B_4B1F_BFA9_E24C9AF89002,
    FAMILY_NAME VARCHAR(255),
    FORMATTED CLOB,
    GIVEN_NAME VARCHAR(255),
    HONORIFIC_PREFIX VARCHAR(255),
    HONORIFIC_SUFFIX VARCHAR(255),
    MIDDLE_NAME VARCHAR(255)
);
ALTER TABLE PUBLIC.SCIM_NAME ADD CONSTRAINT PUBLIC.CONSTRAINT_E0 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_NAME;
CREATE CACHED TABLE PUBLIC.SCIM_PHONENUMBER(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_5E8B313F_C0B1_4541_AD79_72B80F1497BE) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_5E8B313F_C0B1_4541_AD79_72B80F1497BE,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_PHONENUMBER ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_PHONENUMBER;
CREATE INDEX PUBLIC.UK_9WNLEIK7N5UUKSIT3LS1MSOW8 ON PUBLIC.SCIM_PHONENUMBER(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_PHOTO(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E34F7D10_8A51_4DB5_8019_15B7A186C043) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E34F7D10_8A51_4DB5_8019_15B7A186C043,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_PHOTO ADD CONSTRAINT PUBLIC.CONSTRAINT_30D PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_PHOTO;
CREATE INDEX PUBLIC.UK_1ER38KW2ITH4EWUF7B5RHH7BR ON PUBLIC.SCIM_PHOTO(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_ROLES(
    MULTI_VALUE_ID BIGINT DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E80DF453_7A86_4826_B418_9A7152AACC3B) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E80DF453_7A86_4826_B418_9A7152AACC3B,
    IS_PRIMARY BOOLEAN,
    VALUE CLOB,
    TYPE VARCHAR(255),
    USER_INTERNAL_ID BIGINT NOT NULL
);
ALTER TABLE PUBLIC.SCIM_ROLES ADD CONSTRAINT PUBLIC.CONSTRAINT_30F PRIMARY KEY(MULTI_VALUE_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_ROLES;
CREATE INDEX PUBLIC.UK_8QWT29EWJM8URPI7VK10Q2FB3 ON PUBLIC.SCIM_ROLES(TYPE);
CREATE CACHED TABLE PUBLIC.SCIM_USER(
    ACTIVE BOOLEAN,
    DISPLAY_NAME VARCHAR(255),
    LOCALE VARCHAR(255),
    NICK_NAME VARCHAR(255),
    PASSWORD VARCHAR(255) NOT NULL,
    PREFERRED_LANGUAGE VARCHAR(255),
    PROFILE_URL CLOB,
    TIMEZONE VARCHAR(255),
    TITLE VARCHAR(255),
    USER_NAME VARCHAR(255) NOT NULL,
    USER_TYPE VARCHAR(255),
    INTERNAL_ID BIGINT NOT NULL,
    NAME BIGINT
);
ALTER TABLE PUBLIC.SCIM_USER ADD CONSTRAINT PUBLIC.CONSTRAINT_E08 PRIMARY KEY(INTERNAL_ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SCIM_USER;
ALTER TABLE PUBLIC.SCIM_USER ADD CONSTRAINT PUBLIC.UK_O2E5CAAK3GW9ROIL6NBGVEW5O UNIQUE(USER_NAME);
ALTER TABLE PUBLIC.OSIAM_CLIENT ADD CONSTRAINT PUBLIC.UK_C34IILT4H1LN91S9RO8M96HRU UNIQUE(ID);
ALTER TABLE PUBLIC.SCIM_GROUP ADD CONSTRAINT PUBLIC.UK_1S4SWWMX1UDFPMB2PKI9KCN3 UNIQUE(DISPLAY_NAME);
ALTER TABLE PUBLIC.SCIM_ID ADD CONSTRAINT PUBLIC.UK_QN7VP62PGEHNMGKI8DA06AO9I UNIQUE(EXTERNAL_ID);
ALTER TABLE PUBLIC.SCIM_EXTENSION_FIELD ADD CONSTRAINT PUBLIC.UK_HNIHINL5L3JACQLIAJ7XFM1I1 UNIQUE(EXTENSION, NAME);
ALTER TABLE PUBLIC.SCIM_ID ADD CONSTRAINT PUBLIC.UK_Q4YA5M8V6TAFGTVW1INQTMM42 UNIQUE(ID);
ALTER TABLE PUBLIC.OSIAM_CLIENT_GRANTS ADD CONSTRAINT PUBLIC.FK_CTVKL0UDNJ6JPN1P93VBWYWTE FOREIGN KEY(ID) REFERENCES PUBLIC.OSIAM_CLIENT(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_ADDRESS ADD CONSTRAINT PUBLIC.FK_QR6GTQI0H9R6YP034TARLRY1K FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_USER ADD CONSTRAINT PUBLIC.FK_H54K2AU1M19L9WYRP7WPFWLWM FOREIGN KEY(NAME) REFERENCES PUBLIC.SCIM_NAME(ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_PHOTO ADD CONSTRAINT PUBLIC.FK_Q3RK61YLA08PVOD7GQ8AV7I0L FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_EMAIL ADD CONSTRAINT PUBLIC.FK_DMFJ3S46NPN4P1PCRC3IUR2MP FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_EXTENSION_FIELD_VALUE ADD CONSTRAINT PUBLIC.FK_L73AM39PVU1NUBCL19B1E8YLR FOREIGN KEY(EXTENSION_FIELD) REFERENCES PUBLIC.SCIM_EXTENSION_FIELD(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_GROUP_MEMBERS ADD CONSTRAINT PUBLIC.FK_A6VXQCL107CNW02EETBSP24C3 FOREIGN KEY(MEMBERS) REFERENCES PUBLIC.SCIM_ID(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_EXTENSION_FIELD ADD CONSTRAINT PUBLIC.FK_7CKD71YAMQFQDOQTBRMLHMY2N FOREIGN KEY(EXTENSION) REFERENCES PUBLIC.SCIM_EXTENSION(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_ID ADD CONSTRAINT PUBLIC.FK_FDF7TA460A5X0PVFK82FBI1EV FOREIGN KEY(META) REFERENCES PUBLIC.SCIM_META(ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_GROUP_MEMBERS ADD CONSTRAINT PUBLIC.FK_NF2UK4608PIU41R4OSQ5QL4N6 FOREIGN KEY(GROUPS) REFERENCES PUBLIC.SCIM_GROUP(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_EXTENSION_FIELD_VALUE ADD CONSTRAINT PUBLIC.FK_IN6GS4SAFPKNTVAC3V88KE54R FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_CERTIFICATE ADD CONSTRAINT PUBLIC.FK_GHDPGMH1B8SUIMTFXDL8653BJ FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_PHONENUMBER ADD CONSTRAINT PUBLIC.FK_8Q8P62XCREF5GIVACVQ37N8LQ FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_IM ADD CONSTRAINT PUBLIC.FK_HMSAH9DINHK7F8K4LF50H658 FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.OSIAM_CLIENT_SCOPES ADD CONSTRAINT PUBLIC.FK_GL93UW092WUA8DL5CPB5YSN3F FOREIGN KEY(ID) REFERENCES PUBLIC.OSIAM_CLIENT(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_ENTITLEMENTS ADD CONSTRAINT PUBLIC.FK_7JNL5VQCFG1J9PLJ4PY1QVXCP FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_ROLES ADD CONSTRAINT PUBLIC.FK_N5UND6LNRTBLHGS2OCOCPGLYI FOREIGN KEY(USER_INTERNAL_ID) REFERENCES PUBLIC.SCIM_USER(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_USER ADD CONSTRAINT PUBLIC.FK_NX0839HYQD5YRFELXKR2FPR7A FOREIGN KEY(INTERNAL_ID) REFERENCES PUBLIC.SCIM_ID(INTERNAL_ID) NOCHECK;
ALTER TABLE PUBLIC.SCIM_GROUP ADD CONSTRAINT PUBLIC.FK_OARI88X9O5J9JMIGTT5S20M4K FOREIGN KEY(INTERNAL_ID) REFERENCES PUBLIC.SCIM_ID(INTERNAL_ID) NOCHECK;

INSERT INTO PUBLIC.SCIM_EXTENSION VALUES (1, 'urn:org.osiam:scim:extensions:auth-server');
INSERT INTO PUBLIC.SCIM_EXTENSION_FIELD (INTERNAL_ID, REQUIRED, NAME, TYPE, EXTENSION) VALUES (1, FALSE, 'origin', 'STRING', 1);
