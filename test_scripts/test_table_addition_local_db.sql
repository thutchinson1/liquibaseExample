-- ymsowner.titustestlocaltable1 definition

-- Drop table

-- DROP TABLE ymsowner.titustestlocaltable1;

CREATE TABLE ymsowner.titustestlocaltable1 (
       uuid uuid NOT NULL DEFAULT gen_random_uuid(),
       vin bpchar(20) NOT NULL,
       yard_id varchar NULL,
       curr_loc_cd varchar(2) NULL,
       CONSTRAINT titustestlocaltable1_pk PRIMARY KEY (uuid)
);
