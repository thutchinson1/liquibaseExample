-- DROP SCHEMA lqbexample;

--CREATE SCHEMA lqbexample AUTHORIZATION postgres;
-- lqbexample.tbl_acct_loc definition

-- Drop table

-- DROP TABLE lqbexample.tbl_acct_loc;

CREATE TABLE lqbexample.tbl_acct_loc (
	acct_loc_uuid uuid DEFAULT gen_random_uuid() NOT NULL, -- Account Location UUID =
	acct_uuid uuid NOT NULL, -- Account UUID from tbl_acct Table
	loc_cd varchar NOT NULL, -- Location Code from Location Code Table
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL,
	CONSTRAINT tbl_acct_loc_pk PRIMARY KEY (acct_loc_uuid)
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_acct_loc.acct_loc_uuid IS 'Account Location UUID =';
COMMENT ON COLUMN lqbexample.tbl_acct_loc.acct_uuid IS 'Account UUID from tbl_acct Table';
COMMENT ON COLUMN lqbexample.tbl_acct_loc.loc_cd IS 'Location Code from Location Code Table';


-- lqbexample.tbl_acct_typ definition

-- Drop table

-- DROP TABLE lqbexample.tbl_acct_typ;

CREATE TABLE lqbexample.tbl_acct_typ (
	acct_typ varchar(5) NOT NULL, -- Account Type ID
	acct_typ_nm varchar(100) NOT NULL, -- Account Type Name
	acct_typ_desc varchar(500) NULL, -- Account Type Description
	crt_usr_id varchar(20) NOT NULL, -- Created User ID
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Created Timestamp
	upd_usr_id varchar(20) NOT NULL, -- Updated User ID
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Updated Timestamp
	CONSTRAINT tbl_acct_typ_pk PRIMARY KEY (acct_typ)
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_acct_typ.acct_typ IS 'Account Type ID';
COMMENT ON COLUMN lqbexample.tbl_acct_typ.acct_typ_nm IS 'Account Type Name';
COMMENT ON COLUMN lqbexample.tbl_acct_typ.acct_typ_desc IS 'Account Type Description';
COMMENT ON COLUMN lqbexample.tbl_acct_typ.crt_usr_id IS 'Created User ID';
COMMENT ON COLUMN lqbexample.tbl_acct_typ.crt_ts IS 'Created Timestamp';
COMMENT ON COLUMN lqbexample.tbl_acct_typ.upd_usr_id IS 'Updated User ID';
COMMENT ON COLUMN lqbexample.tbl_acct_typ.upd_ts IS 'Updated Timestamp';


-- lqbexample.tbl_cstmr definition

-- Drop table

-- DROP TABLE lqbexample.tbl_cstmr;

CREATE TABLE lqbexample.tbl_cstmr (
	cstmr_uuid uuid DEFAULT gen_random_uuid() NOT NULL, -- Customer UUID = customer unique ID
	cstmr_frst_nm varchar NOT NULL, -- Customer First Name
	cstmr_lst_nm varchar NOT NULL, -- Customer Last Name
	cstmr_adr_1 varchar NOT NULL, -- Customer Address Line 1
	cstmr_adr_2 varchar NULL, -- Customer Address Line 2
	cstmr_cty varchar NOT NULL, -- Customer City
	cstmr_st varchar NOT NULL, -- Customer State
	cstmr_zip varchar NOT NULL, -- Customer Zip
	crt_usr_id varchar(20) NOT NULL, -- Created User ID
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Created Timestamp
	upd_usr_id varchar(20) NOT NULL, -- Updated User ID
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Updated Timestamp
	CONSTRAINT tbl_cstmr_pk PRIMARY KEY (cstmr_uuid)
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_uuid IS 'Customer UUID = customer unique ID';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_frst_nm IS 'Customer First Name';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_lst_nm IS 'Customer Last Name';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_adr_1 IS 'Customer Address Line 1';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_adr_2 IS 'Customer Address Line 2';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_cty IS 'Customer City';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_st IS 'Customer State';
COMMENT ON COLUMN lqbexample.tbl_cstmr.cstmr_zip IS 'Customer Zip';
COMMENT ON COLUMN lqbexample.tbl_cstmr.crt_usr_id IS 'Created User ID';
COMMENT ON COLUMN lqbexample.tbl_cstmr.crt_ts IS 'Created Timestamp';
COMMENT ON COLUMN lqbexample.tbl_cstmr.upd_usr_id IS 'Updated User ID';
COMMENT ON COLUMN lqbexample.tbl_cstmr.upd_ts IS 'Updated Timestamp';


-- lqbexample.tbl_loc definition

-- Drop table

-- DROP TABLE lqbexample.tbl_loc;

CREATE TABLE lqbexample.tbl_loc (
	loc_cd varchar(4) NOT NULL, -- Unique Location Code
	loc_nm varchar(100) NOT NULL, -- Location Name
	loc_desc varchar(500) NULL, -- Location Description
	crt_usr_id varchar(20) NOT NULL, -- Created User ID
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Created Timestamp
	upd_usr_id varchar(20) NOT NULL, -- Updated User ID
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Updated Timestamp
	CONSTRAINT tbl_loc_pk PRIMARY KEY (loc_cd)
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_loc.loc_cd IS 'Unique Location Code';
COMMENT ON COLUMN lqbexample.tbl_loc.loc_nm IS 'Location Name';
COMMENT ON COLUMN lqbexample.tbl_loc.loc_desc IS 'Location Description';
COMMENT ON COLUMN lqbexample.tbl_loc.crt_usr_id IS 'Created User ID';
COMMENT ON COLUMN lqbexample.tbl_loc.crt_ts IS 'Created Timestamp';
COMMENT ON COLUMN lqbexample.tbl_loc.upd_usr_id IS 'Updated User ID';
COMMENT ON COLUMN lqbexample.tbl_loc.upd_ts IS 'Updated Timestamp';


-- lqbexample.tbl_trans definition

-- Drop table

-- DROP TABLE lqbexample.tbl_trans;

CREATE TABLE lqbexample.tbl_trans (
	trans_uuid uuid DEFAULT gen_random_uuid() NOT NULL, -- Transation UUID = Transaction Unique ID
	trans_typ_cd varchar(3) NOT NULL, -- Transaction Type
	trans_beg_bal float8 NOT NULL, -- Transaction Balance at the beggining of the transation
	trans_amt float8 NOT NULL, -- Transaction amount can be + or -
	trans_end_bal float8 NOT NULL, -- Transaction Balance at the end of the transaction
	crt_usr_id varchar(20) NOT NULL, -- Created User ID
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Created Timestamp
	upd_usr_id varchar(20) NOT NULL, -- Updated User ID
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Updated Timestamp
	CONSTRAINT tbl_trans_pk PRIMARY KEY (trans_uuid)
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_trans.trans_uuid IS 'Transation UUID = Transaction Unique ID';
COMMENT ON COLUMN lqbexample.tbl_trans.trans_typ_cd IS 'Transaction Type';
COMMENT ON COLUMN lqbexample.tbl_trans.trans_beg_bal IS 'Transaction Balance at the beggining of the transation';
COMMENT ON COLUMN lqbexample.tbl_trans.trans_amt IS 'Transaction amount can be + or -';
COMMENT ON COLUMN lqbexample.tbl_trans.trans_end_bal IS 'Transaction Balance at the end of the transaction';
COMMENT ON COLUMN lqbexample.tbl_trans.crt_usr_id IS 'Created User ID';
COMMENT ON COLUMN lqbexample.tbl_trans.crt_ts IS 'Created Timestamp';
COMMENT ON COLUMN lqbexample.tbl_trans.upd_usr_id IS 'Updated User ID';
COMMENT ON COLUMN lqbexample.tbl_trans.upd_ts IS 'Updated Timestamp';


-- lqbexample.tbl_trans_typ definition

-- Drop table

-- DROP TABLE lqbexample.tbl_trans_typ;

CREATE TABLE lqbexample.tbl_trans_typ (
	trans_cd varchar(4) NOT NULL, -- Unique Transaction Code
	trans_nm varchar(100) NOT NULL, -- Transaction Name
	trans_desc varchar(500) NULL, -- Transaction Description
	crt_usr_id varchar(20) NOT NULL, -- Created User ID
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Created Timestamp
	upd_usr_id varchar(20) NOT NULL, -- Updated User ID
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Updated Timestamp
	CONSTRAINT tbl_trans_typ_pk PRIMARY KEY (trans_cd)
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_trans_typ.trans_cd IS 'Unique Transaction Code';
COMMENT ON COLUMN lqbexample.tbl_trans_typ.trans_nm IS 'Transaction Name';
COMMENT ON COLUMN lqbexample.tbl_trans_typ.trans_desc IS 'Transaction Description';
COMMENT ON COLUMN lqbexample.tbl_trans_typ.crt_usr_id IS 'Created User ID';
COMMENT ON COLUMN lqbexample.tbl_trans_typ.crt_ts IS 'Created Timestamp';
COMMENT ON COLUMN lqbexample.tbl_trans_typ.upd_usr_id IS 'Updated User ID';
COMMENT ON COLUMN lqbexample.tbl_trans_typ.upd_ts IS 'Updated Timestamp';


-- lqbexample.tbl_acct definition

-- Drop table

-- DROP TABLE lqbexample.tbl_acct;

CREATE TABLE lqbexample.tbl_acct (
	acct_uuid uuid DEFAULT gen_random_uuid() NOT NULL, -- Account UUID = Account Unique ID
	cstmr_uuid uuid NOT NULL, -- Customer UUID from tbl_cstmr table
	acct_typ varchar NOT NULL, -- Account Type
	acct_primary bool DEFAULT false NOT NULL, -- Is the Account Primary?
	acct_notes varchar NULL, -- Account Setup Notes
	crt_usr_id varchar(20) NOT NULL, -- Created User ID
	crt_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Created Timestamp
	upd_usr_id varchar(20) NOT NULL, -- Updated User ID
	upd_ts timestamp(6) DEFAULT (now() AT TIME ZONE 'utc'::text) NOT NULL, -- Updated Timestamp
	CONSTRAINT tbl_acct_pk PRIMARY KEY (acct_uuid),
	CONSTRAINT tbl_acct_tbl_cstmr_fk FOREIGN KEY (cstmr_uuid) REFERENCES lqbexample.tbl_cstmr(cstmr_uuid) ON DELETE CASCADE
);

-- Column comments

COMMENT ON COLUMN lqbexample.tbl_acct.acct_uuid IS 'Account UUID = Account Unique ID';
COMMENT ON COLUMN lqbexample.tbl_acct.cstmr_uuid IS 'Customer UUID from tbl_cstmr table';
COMMENT ON COLUMN lqbexample.tbl_acct.acct_typ IS 'Account Type';
COMMENT ON COLUMN lqbexample.tbl_acct.acct_primary IS 'Is the Account Primary?';
COMMENT ON COLUMN lqbexample.tbl_acct.acct_notes IS 'Account Setup Notes';
COMMENT ON COLUMN lqbexample.tbl_acct.crt_usr_id IS 'Created User ID';
COMMENT ON COLUMN lqbexample.tbl_acct.crt_ts IS 'Created Timestamp';
COMMENT ON COLUMN lqbexample.tbl_acct.upd_usr_id IS 'Updated User ID';
COMMENT ON COLUMN lqbexample.tbl_acct.upd_ts IS 'Updated Timestamp';