-- glsowner.gls_cdl definition

-- Drop table

-- DROP TABLE glsowner.gls_cdl;

CREATE TABLE glsowner.gls_cdl (
	cdl_cd varchar(2) NOT NULL,
	cdl_nm varchar(100) NOT NULL,
	cdl_desc varchar(500) NULL,
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_cdl_code_pk PRIMARY KEY (cdl_cd),
	CONSTRAINT gls_cdl_code_uk UNIQUE (cdl_nm)
);


-- glsowner.gls_dmg_area definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg_area;

CREATE TABLE glsowner.gls_dmg_area (
	dmg_area_cd varchar(10) NOT NULL,
	dmg_area_nm varchar(50) NOT NULL,
	dmg_area_desc varchar(500) NULL,
	is_open_flg bool NOT NULL DEFAULT false,
	crt_usr_id varchar(11) NOT NULL,
	crt_ts timestamp(6) NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(11) NOT NULL,
	upd_ts timestamp(6) NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	dsabl_flg bool NOT NULL DEFAULT false,
	tcn numeric(9) NOT NULL DEFAULT 1,
	CONSTRAINT dmg_area_pk PRIMARY KEY (dmg_area_cd)
);


-- glsowner.gls_dmg_inf definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg_inf;

CREATE TABLE glsowner.gls_dmg_inf (
	dmg_info_id uuid NOT NULL DEFAULT gen_random_uuid(),
	dmg_uuid uuid NOT NULL,
	ramp_id_cd varchar NULL,
	city_nm varchar NULL,
	st_cd varchar NULL,
	id_cd_qualf varchar NULL,
	equip_init varchar NULL,
	equip_num varchar NULL,
	waybill_dt timestamp NULL,
	seal_stat_cd varchar NULL,
	car_type_cd varchar NULL,
	veh_deck_pos_cd varchar NULL,
	dlr_cd varchar NULL,
	rte_cd varchar NULL,
	bay_loc varchar NULL,
	auto_mfr_cd varchar NULL DEFAULT 1,
	dmg_excp_ind varchar(1) NULL,
	supp_inspn_cd varchar NULL,
	fcty_car_ord_num varchar NULL,
	vsl_stowage_loc varchar NULL,
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_dmg_inf_pk PRIMARY KEY (dmg_info_id)
);


-- glsowner.gls_dmg_svrty definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg_svrty;

CREATE TABLE glsowner.gls_dmg_svrty (
	dmg_svrty_cd varchar(10) NOT NULL,
	dmg_svrty_nm varchar(200) NOT NULL,
	dmg_svrty_desc varchar(500) NULL,
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	dsabl_flg bool NOT NULL DEFAULT false,
	tcn numeric(9) NOT NULL DEFAULT 1,
	CONSTRAINT dmg_svrty_pk PRIMARY KEY (dmg_svrty_cd),
	CONSTRAINT ds_nm_uk UNIQUE (dmg_svrty_nm)
);


-- glsowner.gls_dmg_typ definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg_typ;

CREATE TABLE glsowner.gls_dmg_typ (
	dmg_typ_cd varchar(10) NOT NULL,
	dmg_typ_nm varchar(100) NOT NULL,
	dmg_typ_desc varchar(500) NULL,
	crt_usr_id varchar(11) NOT NULL,
	crt_ts timestamp(6) NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(11) NOT NULL,
	upd_ts timestamp(6) NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	dsabl_flg bool NOT NULL DEFAULT false,
	tcn numeric(9) NOT NULL DEFAULT 1,
	CONSTRAINT dmg_typ_pk PRIMARY KEY (dmg_typ_cd)
);


-- glsowner.gls_region definition

-- Drop table

-- DROP TABLE glsowner.gls_region;

CREATE TABLE glsowner.gls_region (
	region_cd varchar(4) NOT NULL,
	region_nm varchar(100) NOT NULL,
	region_desc varchar(100) NULL,
	crt_ust_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_region_pk PRIMARY KEY (region_cd)
);


-- glsowner.gls_dmg_area_sub definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg_area_sub;

CREATE TABLE glsowner.gls_dmg_area_sub (
	dmg_area_sub_cd varchar(10) NOT NULL,
	dmg_area_sub_nm varchar(50) NOT NULL,
	dmg_area_sub_desc varchar(500) NULL,
	dmg_area_cd varchar(10) NOT NULL,
	vin bpchar(20) NOT NULL,
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_dmg_area_sub_pk PRIMARY KEY (dmg_area_sub_cd, dmg_area_cd),
	CONSTRAINT gls_dmg_area_sub_uk UNIQUE (dmg_area_sub_nm),
	CONSTRAINT gls_dmg_area_sub_fk FOREIGN KEY (dmg_area_cd) REFERENCES glsowner.gls_dmg_area(dmg_area_cd)
);


-- glsowner.gls_loc definition

-- Drop table

-- DROP TABLE glsowner.gls_loc;

CREATE TABLE glsowner.gls_loc (
	loc_cd varchar(4) NOT NULL,
	loc_nm varchar(100) NOT NULL,
	loc_desc varchar(500) NULL,
	loc_desc2 varchar(500) NULL,
	region_cd varchar(4) NOT NULL,
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_loc_cd_pk PRIMARY KEY (loc_cd),
	CONSTRAINT gls_loc_un UNIQUE (region_cd),
	CONSTRAINT gls_loc_fk FOREIGN KEY (region_cd) REFERENCES glsowner.gls_region(region_cd)
);


-- glsowner.gls_dmg definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg;

CREATE TABLE glsowner.gls_dmg (
	dmg_uuid uuid NOT NULL DEFAULT gen_random_uuid(),
	nspct_uuid uuid NOT NULL,
	dmg_idx int8 NOT NULL,
	dmg_area_cd varchar(10) NOT NULL,
	dmg_typ_cd varchar(10) NOT NULL,
	dmg_svrty_cd varchar(10) NOT NULL,
	dmg_grid_cd varchar(10) NOT NULL,
	dmg_note varchar(500) NULL,
	is_ntrl_cause bool NOT NULL DEFAULT false,
	is_repr bool NOT NULL DEFAULT false,
	repr_dt timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_damage_uk UNIQUE (nspct_uuid),
	CONSTRAINT gls_dmg_pk PRIMARY KEY (dmg_uuid)
);


-- glsowner.gls_dmg_img definition

-- Drop table

-- DROP TABLE glsowner.gls_dmg_img;

CREATE TABLE glsowner.gls_dmg_img (
	dmg_img_uuid uuid NOT NULL DEFAULT gen_random_uuid(),
	dmg_uuid uuid NOT NULL,
    img_idx int8 NOT NULL,
	img bytea NOT NULL,
	crt_ust_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_dmg_img_pk PRIMARY KEY (dmg_img_uuid)
);


-- glsowner.gls_nspct definition

-- Drop table

-- DROP TABLE glsowner.gls_nspct;

CREATE TABLE glsowner.gls_nspct (
	nspct_uuid uuid NOT NULL DEFAULT gen_random_uuid(),
	vin bpchar(20) NOT NULL,
	nspct_id int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1 NO CYCLE),
	trp_scac varchar(4) NOT NULL,
	nspct_scac varchar(4) NOT NULL,
	loc_cd varchar NOT NULL,
	dmg_flg bool NOT NULL DEFAULT false,
	crt_usr_id varchar(20) NOT NULL,
	crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	upd_usr_id varchar(20) NOT NULL,
	upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text),
	CONSTRAINT gls_nspct_pk PRIMARY KEY (nspct_uuid),
	CONSTRAINT gls_nspct_un UNIQUE (nspct_id)
);


-- glsowner.gls_scac_code definition

-- Drop table

-- DROP TABLE glsowner.gls_scac;

CREATE TABLE glsowner.gls_scac (
	scac_cd varchar(4) NOT NULL,
	scac_nm varchar(100) NOT NULL,
	scac_desc varchar(500) NULL,
	crt_usr_id varchar(20) NOT NULL, -- GM Database record Insert User or Process
	    crt_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text), -- GM Database record Insert Timestamp
	    upd_usr_id varchar(20) NOT NULL, -- GM Database record Update User or Process
	    upd_ts timestamp(6) NOT NULL DEFAULT (now() AT TIME ZONE 'utc'::text), -- GM Database record Update Timestamp
	CONSTRAINT gls_scac_cd_pk PRIMARY KEY (scac_cd),
	CONSTRAINT gls_scac_cd_uk UNIQUE (scac_nm)
);


-- glsowner.gls_dmg foreign keys

ALTER TABLE glsowner.gls_dmg ADD CONSTRAINT gls_dmg_fk FOREIGN KEY (nspct_uuid) REFERENCES glsowner.gls_nspct(nspct_uuid);
ALTER TABLE glsowner.gls_dmg ADD CONSTRAINT gls_dmg_fk2 FOREIGN KEY (dmg_area_cd) REFERENCES glsowner.gls_dmg_area(dmg_area_cd);
ALTER TABLE glsowner.gls_dmg ADD CONSTRAINT gls_dmg_fk3 FOREIGN KEY (dmg_typ_cd) REFERENCES glsowner.gls_dmg_typ(dmg_typ_cd);
ALTER TABLE glsowner.gls_dmg ADD CONSTRAINT gls_dmg_fk4 FOREIGN KEY (dmg_svrty_cd) REFERENCES glsowner.gls_dmg_svrty(dmg_svrty_cd);


-- glsowner.gls_dmg_img foreign keys

ALTER TABLE glsowner.gls_dmg_img ADD CONSTRAINT gls_dmg_img_fk FOREIGN KEY (dmg_uuid) REFERENCES glsowner.gls_dmg(dmg_uuid);


-- glsowner.gls_nspct foreign keys

ALTER TABLE glsowner.gls_nspct ADD CONSTRAINT gls_nspct_fk FOREIGN KEY (trp_scac) REFERENCES glsowner.gls_scac(scac_cd);
ALTER TABLE glsowner.gls_nspct ADD CONSTRAINT gls_nspct_fk2 FOREIGN KEY (nspct_scac) REFERENCES glsowner.gls_scac(scac_cd);