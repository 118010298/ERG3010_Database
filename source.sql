show databases;
set sql_safe_updates = 0;
show variables like '%buffer_size%';
use bridge;

/*loading raw data*/
drop table if exists bridge;
CREATE TABLE BRIDGE(
STATE_CODE_001 varchar(50),
STRUCTURE_NUMBER_008 varchar(50),
RECORD_TYPE_005A varchar(50),
ROUTE_PREFIX_005B varchar(50),
SERVICE_LEVEL_005C varchar(50),
ROUTE_NUMBER_005D varchar(50),
DIRECTION_005E varchar(50),
HIGHWAY_DISTRICT_002 varchar(50),
COUNTY_CODE_003 varchar(50),
PLACE_CODE_004 varchar(50),
FEATURES_DESC_006A varchar(50),
CRITICAL_FACILITY_006B varchar(50),
FACILITY_CARRIED_007 varchar(50),
LOCATION_009 varchar(50),
MIN_VERT_CLR_010 varchar(50),
KILOPOINT_011 varchar(50),
BASE_HWY_NETWORK_012 varchar(50),
LRS_INV_ROUTE_013A varchar(50),
SUBROUTE_NO_013B varchar(50),
LAT_016 varchar(50),
LONG_017 varchar(50),
DETOUR_KILOS_019 varchar(50),
TOLL_020 varchar(50),
MAINTENANCE_021 varchar(50),
OWNER_022 varchar(50),
FUNCTIONAL_CLASS_026 varchar(50),
YEAR_BUILT_027 varchar(50),
TRAFFIC_LANES_ON_028A varchar(50),
TRAFFIC_LANES_UND_028B varchar(50),
ADT_029 varchar(50),
YEAR_ADT_030 varchar(50),
DESIGN_LOAD_031 varchar(50),
APPR_WIDTH_MT_032 varchar(50),
MEDIAN_CODE_033 varchar(50),
DEGREES_SKEW_034 varchar(50),
STRUCTURE_FLARED_035 varchar(50),
RAILINGS_036A varchar(50),
TRANSITIONS_036B varchar(50),
APPR_RAIL_036C varchar(50),
APPR_RAIL_END_036D varchar(50),
HISTORY_037 varchar(50),
NAVIGATION_038 varchar(50),
NAV_VERT_CLR_MT_039 varchar(50),
NAV_HORR_CLR_MT_040 varchar(50),
OPEN_CLOSED_POSTED_041 varchar(50),
SERVICE_ON_042A varchar(50),
SERVICE_UND_042B varchar(50),
STRUCTURE_KIND_043A varchar(50),
STRUCTURE_TYPE_043B varchar(50),
APPR_KIND_044A varchar(50),
APPR_TYPE_044B varchar(50),
MAIN_UNIT_SPANS_045 varchar(50),
APPR_SPANS_046 varchar(50),
HORR_CLR_MT_047 varchar(50),
MAX_SPAN_LEN_MT_048 varchar(50),
STRUCTURE_LEN_MT_049 varchar(50),
LEFT_CURB_MT_050A varchar(50),
RIGHT_CURB_MT_050B varchar(50),
ROADWAY_WIDTH_MT_051 varchar(50),
DECK_WIDTH_MT_052 varchar(50),
VERT_CLR_OVER_MT_053 varchar(50),
VERT_CLR_UND_REF_054A varchar(50),
VERT_CLR_UND_054B varchar(50),
LAT_UND_REF_055A varchar(50),
LAT_UND_MT_055B varchar(50),
LEFT_LAT_UND_MT_056 varchar(50),
DECK_COND_058 varchar(50),
SUPERSTRUCTURE_COND_059 varchar(50),
SUBSTRUCTURE_COND_060 varchar(50),
CHANNEL_COND_061 varchar(50),
CULVERT_COND_062 varchar(50),
OPR_RATING_METH_063 varchar(50),
OPERATING_RATING_064 varchar(50),
INV_RATING_METH_065 varchar(50),
INVENTORY_RATING_066 varchar(50),
STRUCTURAL_EVAL_067 varchar(50),
DECK_GEOMETRY_EVAL_068 varchar(50),
UNDCLRENCE_EVAL_069 varchar(50),
POSTING_EVAL_070 varchar(50),
WATERWAY_EVAL_071 varchar(50),
APPR_ROAD_EVAL_072 varchar(50),
WORK_PROPOSED_075A varchar(50),
WORK_DONE_BY_075B varchar(50),
IMP_LEN_MT_076 varchar(50),
DATE_OF_INSPECT_090 varchar(50),
INSPECT_FREQ_MONTHS_091 varchar(50),
FRACTURE_092A varchar(50),
UNDWATER_LOOK_SEE_092B varchar(50),
SPEC_INSPECT_092C varchar(50),
FRACTURE_LAST_DATE_093A varchar(50),
UNDWATER_LAST_DATE_093B varchar(50),
SPEC_LAST_DATE_093C varchar(50),
BRIDGE_IMP_COST_094 varchar(50),
ROADWAY_IMP_COST_095 varchar(50),
TOTAL_IMP_COST_096 varchar(50),
YEAR_OF_IMP_097 varchar(50),
OTHER_STATE_CODE_098A varchar(50),
OTHER_STATE_PCNT_098B varchar(50),
OTHR_STATE_STRUC_NO_099 varchar(50),
STRAHNET_HIGHWAY_100 varchar(50),
PARALLEL_STRUCTURE_101 varchar(50),
TRAFFIC_DIRECTION_102 varchar(50),
TEMP_STRUCTURE_103 varchar(50),
HIGHWAY_SYSTEM_104 varchar(50),
FEDERAL_LANDS_105 varchar(50),
YEAR_RECONSTRUCTED_106 varchar(50),
DECK_STRUCTURE_TYPE_107 varchar(50),
SURFACE_TYPE_108A varchar(50),
MEMBRANE_TYPE_108B varchar(50),
DECK_PROTECTION_108C varchar(50),
PERCENT_ADT_TRUCK_109 varchar(50),
NATIONAL_NETWORK_110 varchar(50),
PIER_PROTECTION_111 varchar(50),
BRIDGE_LEN_IND_112 varchar(50),
SCOUR_CRITICAL_113 varchar(50),
FUTURE_ADT_114 varchar(50),
YEAR_OF_FUTURE_ADT_115 varchar(50),
MIN_NAV_CLR_MT_116 varchar(50),
FED_AGENCY varchar(50),
DATE_LAST_UPDATE varchar(50),
TYPE_LAST_UPDATE varchar(50),
DEDUCT_CODE varchar(50),
REMARKS varchar(50),
PROGRAM_CODE varchar(50),
PROJ_NO varchar(50),
PROJ_SUFFIX varchar(50),
NBI_TYPE_OF_IMP varchar(50),
DTL_TYPE_OF_IMP varchar(50),
SPECIAL_CODE varchar(50),
STEP_CODE varchar(50),
STATUS_WITH_10YR_RULE varchar(50),
SUFFICIENCY_ASTERC varchar(50),
SUFFICIENCY_RATING varchar(50),
STATUS_NO_10YR_RULE varchar(50),
CAT10 varchar(50)
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/AllStatesBridges.csv' into table BRIDGE
fields terminated by ','
optionally enclosed by '"' escaped by '"'
lines terminated by '\r\n';


/*data regularization*/
alter database bridge CHARACTER SET = utf8mb4;
alter table bridge row_format = dynamic;
update bridge set STATE_CODE_001 = lpad(STATE_CODE_001, 3, 0);
update bridge set ROUTE_PREFIX_005B = nullif(ROUTE_PREFIX_005B, '');
update bridge set SERVICE_LEVEL_005C = nullif(SERVICE_LEVEL_005C, '');
update bridge set ROUTE_NUMBER_005D = lpad(ROUTE_NUMBER_005D, 5, 0);
update bridge set DIRECTION_005E = nullif(DIRECTION_005E, '');
update bridge set STRUCTURE_NUMBER_008 = replace(STRUCTURE_NUMBER_008, '-', '');
update bridge set STRUCTURE_NUMBER_008 = lpad(STRUCTURE_NUMBER_008, 15, 0);
update bridge set STRUCTURE_NUMBER_008 = nullif(STRUCTURE_NUMBER_008, '');
update bridge set MIN_VERT_CLR_010 = nullif(MIN_VERT_CLR_010, '');
update bridge set DETOUR_KILOS_019 = nullif(DETOUR_KILOS_019, '');
update bridge set TOLL_020 = nullif(TOLL_020, '');
update bridge set FUNCTIONAL_CLASS_026 = lpad(FUNCTIONAL_CLASS_026, 2, 0);
update bridge set YEAR_BUILT_027 = lpad(YEAR_BUILT_027,4,0);
update bridge set TRAFFIC_LANES_ON_028A = lpad(TRAFFIC_LANES_ON_028A, 2, 0);
update bridge set TRAFFIC_LANES_UND_028B = lpad(TRAFFIC_LANES_UND_028B, 2, 0);
update bridge set ADT_029 = nullif(ADT_029, '');
update bridge set DESIGN_LOAD_031 = nullif(DESIGN_LOAD_031, '');
update bridge set APPR_WIDTH_MT_032 = nullif(APPR_WIDTH_MT_032, '');
update bridge set STRUCTURE_FLARED_035 = nullif(STRUCTURE_FLARED_035, '');
update bridge set RAILINGS_036A = nullif(RAILINGS_036A, '');
update bridge set TRANSITIONS_036B = nullif(TRANSITIONS_036B, '');
update bridge set APPR_RAIL_036C = nullif(APPR_RAIL_036C, '');
update bridge set APPR_RAIL_END_036D = nullif(APPR_RAIL_END_036D, '');
update bridge set HISTORY_037 = nullif(HISTORY_037, '');
update bridge set SERVICE_ON_042A = nullif(SERVICE_ON_042A, '');
update bridge set SERVICE_UND_042B = nullif(SERVICE_UND_042B, '');
update bridge set STRUCTURE_KIND_043A = nullif(STRUCTURE_KIND_043A, '');
update bridge set STRUCTURE_TYPE_043B = lpad(STRUCTURE_TYPE_043B,2,0);
update bridge set APPR_KIND_044A = nullif(APPR_KIND_044A, '');
update bridge set APPR_TYPE_044B = nullif(APPR_TYPE_044B, '');
update bridge set MAX_SPAN_LEN_MT_048=nullif(MAX_SPAN_LEN_MT_048, '');
update bridge set STRUCTURE_LEN_MT_049=nullif(STRUCTURE_LEN_MT_049, '');
update bridge set DECK_WIDTH_MT_052=nullif(DECK_WIDTH_MT_052, '');
update bridge set VERT_CLR_OVER_MT_053=nullif(VERT_CLR_OVER_MT_053, '');
update bridge set VERT_CLR_UND_REF_054A=nullif(VERT_CLR_UND_REF_054A, '');
update bridge set DECK_COND_058 = nullif(DECK_COND_058, '');
update bridge set SUPERSTRUCTURE_COND_059=nullif(SUPERSTRUCTURE_COND_059, '');
update bridge set INVENTORY_RATING_066=nullif(INVENTORY_RATING_066, '');
update bridge set DECK_GEOMETRY_EVAL_068 = nullif(DECK_GEOMETRY_EVAL_068, '');
update bridge set UNDCLRENCE_EVAL_069=nullif(UNDCLRENCE_EVAL_069, '');
update bridge set WATERWAY_EVAL_071 = nullif(WATERWAY_EVAL_071, '');
update bridge set WORK_PROPOSED_075A = nullif(WORK_PROPOSED_075A, '');
update bridge set WORK_DONE_BY_075B = nullif(WORK_DONE_BY_075B, '');
update bridge set IMP_LEN_MT_076 = nullif(IMP_LEN_MT_076, '');
update bridge set DATE_OF_INSPECT_090 = lpad(DATE_OF_INSPECT_090, 4, 0);
update bridge set BRIDGE_IMP_COST_094 = nullif(BRIDGE_IMP_COST_094, '');
update bridge set TRAFFIC_DIRECTION_102 = nullif(TRAFFIC_DIRECTION_102, '');
update bridge set DECK_STRUCTURE_TYPE_107=nullif(DECK_STRUCTURE_TYPE_107, '');
update bridge set SURFACE_TYPE_108A = nullif(SURFACE_TYPE_108A, '');
update bridge set MEMBRANE_TYPE_108B = nullif(MEMBRANE_TYPE_108B, '');
update bridge set DECK_PROTECTION_108C = nullif(DECK_PROTECTION_108C, '');
update bridge set NATIONAL_NETWORK_110 = nullif(NATIONAL_NETWORK_110, '');
update bridge set PERCENT_ADT_TRUCK_109 = lpad(PERCENT_ADT_TRUCK_109, 2, 0);
update bridge set MIN_NAV_CLR_MT_116 = nullif(MIN_NAV_CLR_MT_116, '');

update bridge set DATE_OF_INSPECT_090 = concat(left(DATE_OF_INSPECT_090, 2), '/', right(DATE_OF_INSPECT_090, length(DATE_OF_INSPECT_090)-2));
update bridge set DATE_OF_INSPECT_090 = str_to_date(DATE_OF_INSPECT_090, '%m/%y');

select concat(STRUCTURE_KIND_043A,STRUCTURE_TYPE_043B) from bridge;
select concat(LRS_INV_ROUTE_013A, SUBROUTE_NO_013B) from bridge;

alter table bridge
add column item_013 varchar(12) after SUBROUTE_NO_013B,
add column item_043 varchar(3) after STRUCTURE_TYPE_043B;
alter table bridge add column item_028 varchar(4) after TRAFFIC_LANES_UND_028B;
alter table bridge add column item_042 varchar(2) after SERVICE_UND_042B;

update bridge set item_013 = concat(LRS_INV_ROUTE_013A, SUBROUTE_NO_013B);

update bridge set item_043 = concat(STRUCTURE_KIND_043A,STRUCTURE_TYPE_043B);

update bridge set item_028 = concat(TRAFFIC_LANES_ON_028A,TRAFFIC_LANES_UND_028B);

update bridge set item_042 = concat(SERVICE_ON_042A, SERVICE_UND_042B);


/*create table and insert data*/
show tables;
drop table if exists bridge_info;
drop table if exists bridge_info_h;
drop table if exists bridge_info_r;
drop table if exists bridge_info_n;
drop table if exists bridge_inspect;
drop table if exists inventory_route;
drop table if exists traffic;


create table if not exists BRIDGE_INFO(
STATE_CODE_001				char(3) 	not null,
STRUCTURE_NUMBER_008		char(15)	not null,
YEAR_BUILT_027				integer,
STRUCTURE_FLARED_035		integer,
RAILINGS_036A 				char(1),
TRANSITIONS_036B 			char(1),
APPR_RAIL_036C 				char(1),
APPR_RAIL_END_036D 			char(1),
HISTORY_037 				integer,
SERVICE_ON_042A				integer,
SERVICE_UND_042B			integer,
STRUCTURE_KIND_043A			integer,
STRUCTURE_TYPE_043B			char(2),
APPR_KIND_044A				integer,
APPR_TYPE_044B				char(2),
MAX_SPAN_LEN_MT_048			double,
STRUCTURE_LEN_MT_049		double,
DECK_WIDTH_MT_052			double,
VERT_CLR_OVER_MT_053		double,
VERT_CLR_UND_REF_054A		char(1),
SUPERSTRUCTURE_COND_059		char(1),
INVENTORY_RATING_066		double,
UNDCLRENCE_EVAL_069			char(1),
DECK_STRUCTURE_TYPE_107		char(1),

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008),
constraint UNI1 unique(STATE_CODE_001, STRUCTURE_NUMBER_008)
);

CREATE INDEX source_index 
ON bridge (STATE_CODE_001(3), STRUCTURE_NUMBER_008(15), DATE_OF_INSPECT_090(10));

drop index source_index on bridge;

insert into BRIDGE_INFO select
STATE_CODE_001, 
STRUCTURE_NUMBER_008, 
YEAR_BUILT_027,
STRUCTURE_FLARED_035,
RAILINGS_036A,
TRANSITIONS_036B,
APPR_RAIL_036C,
APPR_RAIL_END_036D,
HISTORY_037,
SERVICE_ON_042A,
SERVICE_UND_042B,
STRUCTURE_KIND_043A,
STRUCTURE_TYPE_043B,
APPR_KIND_044A,
APPR_TYPE_044B,
MAX_SPAN_LEN_MT_048,
STRUCTURE_LEN_MT_049,
DECK_WIDTH_MT_052,
VERT_CLR_OVER_MT_053,
VERT_CLR_UND_REF_054A, 
SUPERSTRUCTURE_COND_059, 
INVENTORY_RATING_066,
UNDCLRENCE_EVAL_069,
DECK_STRUCTURE_TYPE_107
from (select * from 
(select * from bridge order by DATE_OF_INSPECT_090 desc) as temp 
group by  STATE_CODE_001, STRUCTURE_NUMBER_008 
order by DATE_OF_INSPECT_090 desc) as temp;



create table if not exists BRIDGE_INSPECT(
STATE_CODE_001				char(3) 	not null,
STRUCTURE_NUMBER_008		char(15)	not null,
DECK_COND_058				char(1),
DECK_GEOMETRY_EVAL_068		char(1),
WATERWAY_EVAL_071			char(1),
WORK_PROPOSED_075A			char(2),
WORK_DONE_BY_075B			char(1),
IMP_LEN_MT_076				float,
DATE_OF_INSPECT_090			char(10),
BRIDGE_IMP_COST_094			integer,
YEAR_OF_IMP_097				char(4),

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008, YEAR_OF_IMP_097),
foreign key(STATE_CODE_001, STRUCTURE_NUMBER_008) references BRIDGE_INFO(STATE_CODE_001, STRUCTURE_NUMBER_008) on delete cascade,
constraint UNI2 unique(STATE_CODE_001, STRUCTURE_NUMBER_008, YEAR_OF_IMP_097)
);

create index BI_INDEX on bridge(STATE_CODE_001, STRUCTURE_NUMBER_008, YEAR_OF_IMP_097);
drop index BI_INDEX on bridge;

insert into BRIDGE_INSPECT select
STATE_CODE_001, 
STRUCTURE_NUMBER_008,
DECK_COND_058,
DECK_GEOMETRY_EVAL_068,
WATERWAY_EVAL_071,
WORK_PROPOSED_075A,
WORK_DONE_BY_075B,
IMP_LEN_MT_076,
DATE_OF_INSPECT_090,
BRIDGE_IMP_COST_094,
YEAR_OF_IMP_097
from (select * from
bridge
group by  STATE_CODE_001, STRUCTURE_NUMBER_008, YEAR_OF_IMP_097) as temp;




create table if not exists INVENTORY_ROUTE(
STATE_CODE_001				char(3)		not null,
RECORD_TYPE_005A			char(1),
ROUTE_PREFIX_005B			integer,
SERVICE_LEVEL_005C			integer,
ROUTE_NUMBER_005D			char(5),
DIRECTION_005E				integer,
STRUCTURE_NUMBER_008		char(15)	not null,
MIN_VERT_CLR_010			double,
DETOUR_KILOS_019			integer,
TOLL_020					integer,
FUNCTIONAL_CLASS_026		char(2),
TRAFFIC_LANES_ON_028A		integer,
TRAFFIC_LANES_UND_028B		integer,
DESIGN_LOAD_031				char(1),
APPR_WIDTH_MT_032			double,
TRAFFIC_DIRECTION_102		integer,
SURFACE_TYPE_108A			char(1),
MEMBRANE_TYPE_108B			char(1),
DECK_PROTECTION_108C		char(1),
NATIONAL_NETWORK_110		integer,

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D),
foreign key(STATE_CODE_001, STRUCTURE_NUMBER_008) references BRIDGE_INFO(STATE_CODE_001, STRUCTURE_NUMBER_008) on delete cascade,
constraint unique(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D)
);


insert into INVENTORY_ROUTE select
STATE_CODE_001,
RECORD_TYPE_005A,
ROUTE_PREFIX_005B,
SERVICE_LEVEL_005C,
ROUTE_NUMBER_005D,
DIRECTION_005E, 
STRUCTURE_NUMBER_008, 
MIN_VERT_CLR_010,
DETOUR_KILOS_019,
TOLL_020,
FUNCTIONAL_CLASS_026,
TRAFFIC_LANES_ON_028A,
TRAFFIC_LANES_UND_028B,
DESIGN_LOAD_031,
APPR_WIDTH_MT_032,
TRAFFIC_DIRECTION_102,
SURFACE_TYPE_108A,
MEMBRANE_TYPE_108B,
DECK_PROTECTION_108C,
NATIONAL_NETWORK_110
from (select * from 
(select * from bridge order by DATE_OF_INSPECT_090 desc) as temp 
group by  STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D
order by DATE_OF_INSPECT_090 desc) as temp;



create table if not exists TRAFFIC(
STATE_CODE_001				char(3)		not null,
ROUTE_NUMBER_005D			char(5)		not null,
STRUCTURE_NUMBER_008		char(15)	not null,
ADT_029						integer,
YEAR_ADT_030				char(4),
PERCENT_ADT_TRUCK_109		integer,

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D, YEAR_ADT_030),
foreign key(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D) 
	references INVENTORY_ROUTE(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D),
constraint unique(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D, YEAR_ADT_030)
);

create index tf_index on bridge(STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D, YEAR_ADT_030);
drop index tf_index on bridge;

insert into TRAFFIC select
STATE_CODE_001,
ROUTE_NUMBER_005D,
STRUCTURE_NUMBER_008,
ADT_029,
YEAR_ADT_030,
PERCENT_ADT_TRUCK_109
from (select * from
bridge group by STATE_CODE_001, STRUCTURE_NUMBER_008, ROUTE_NUMBER_005D, YEAR_ADT_030
order by YEAR_ADT_030) as temp;



create table if not exists BRIDGE_INFO_H(
STATE_CODE_001				char(3)		not null,
STRUCTURE_NUMBER_008		char(15)	not null,
VERT_CLR_UND_054B			double,
LAT_UND_MT_055B				double,
VERT_CLR_UND_REF_054A		char(1),

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008),
foreign key(STATE_CODE_001, STRUCTURE_NUMBER_008) references BRIDGE_INFO(STATE_CODE_001, STRUCTURE_NUMBER_008),
constraint check(VERT_CLR_UND_REF_054A = 'H')
);


insert delayed into BRIDGE_INFO_H select
STATE_CODE_001,
STRUCTURE_NUMBER_008,
VERT_CLR_UND_054B,
LAT_UND_MT_055B,
VERT_CLR_UND_REF_054A
from (select * from 
(select * from bridge order by DATE_OF_INSPECT_090 desc) as temp 
group by  STATE_CODE_001, STRUCTURE_NUMBER_008 
order by DATE_OF_INSPECT_090 desc) as temp
where(VERT_CLR_UND_REF_054A = 'H');


create table if not exists BRIDGE_INFO_R(
STATE_CODE_001				char(3)		not null,
STRUCTURE_NUMBER_008		char(15)	not null,
VERT_CLR_UND_054B			double,
LAT_UND_MT_055B				double,
VERT_CLR_UND_REF_054A		char(1),

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008),
foreign key(STATE_CODE_001, STRUCTURE_NUMBER_008) references BRIDGE_INFO(STATE_CODE_001, STRUCTURE_NUMBER_008),
constraint check(VERT_CLR_UND_REF_054A = 'R')
);

insert into BRIDGE_INFO_R select
STATE_CODE_001,
STRUCTURE_NUMBER_008,
VERT_CLR_UND_054B,
LAT_UND_MT_055B,
VERT_CLR_UND_REF_054A
from (select * from 
(select * from bridge order by DATE_OF_INSPECT_090 desc) as temp 
group by  STATE_CODE_001, STRUCTURE_NUMBER_008 
order by DATE_OF_INSPECT_090 desc) as temp
where(VERT_CLR_UND_REF_054A = 'R');




create table if not exists BRIDGE_INFO_N(
STATE_CODE_001				char(3)		not null,
STRUCTURE_NUMBER_008		char(15)	not null,
NAV_VERT_CLR_MT_039			double,
MIN_NAV_CLR_MT_116			double,
VERT_CLR_UND_REF_054A		char(1),

primary key(STATE_CODE_001, STRUCTURE_NUMBER_008),
foreign key(STATE_CODE_001, STRUCTURE_NUMBER_008) references BRIDGE_INFO(STATE_CODE_001, STRUCTURE_NUMBER_008),
constraint check(VERT_CLR_UND_REF_054A = 'N')
);

insert into BRIDGE_INFO_N select
STATE_CODE_001,
STRUCTURE_NUMBER_008,
NAV_VERT_CLR_MT_039,
MIN_NAV_CLR_MT_116,
VERT_CLR_UND_REF_054A
from (select * from 
(select * from bridge order by DATE_OF_INSPECT_090 desc) as temp 
group by  STATE_CODE_001, STRUCTURE_NUMBER_008 
order by DATE_OF_INSPECT_090 desc) as temp
where(VERT_CLR_UND_REF_054A = 'N');


/*codes for question 1*/

create index by_index on bridge(STATE_CODE_001,STRUCTURE_NUMBER_008,YEAR_BUILT_027); 
drop index by_index on bridge;


select STATE_CODE_001, YEAR_BUILT_027, max(cnt) as max
from (select STATE_CODE_001, YEAR_BUILT_027, count(*) as cnt 
from (select STATE_CODE_001, STRUCTURE_NUMBER_008, YEAR_BUILT_027 from bridge) as sub
group by STATE_CODE_001, YEAR_BUILT_027
order by cnt desc) as sub
group by STATE_CODE_001
order by STATE_CODE_001;


/*codes for question 2 & 3. NOTICE: the raw data for question 2 & 3 was pre-processed and all converted to numeric with python, which is not the original raw data.*/
drop table test_bridge;

/*loading data from outside*/
create table if not exists test_bridge(
STATE_CODE_001 varchar(50),
STRUCTURE_NUMBER_008 varchar(50),	
MIN_VERT_CLR_010	 varchar(50),
DETOUR_KILOS_019	 varchar(50),
TOLL_020	varchar(50),
FUNCTIONAL_CLASS_026 varchar(50),
TRAFFIC_LANES_ON_028A	 varchar(50),
TRAFFIC_LANES_UND_028B	 varchar(50),
ADT_029	varchar(50),
DESIGN_LOAD_031 varchar(50),
APPR_WIDTH_MT_032	varchar(50),
STRUCTURE_FLARED_035	 varchar(50),
RAILINGS_036A	 varchar(50),
TRANSITIONS_036B	varchar(50),
APPR_RAIL_036C	 varchar(50),
APPR_RAIL_END_036D	 varchar(50),
HISTORY_037 varchar(50),
SERVICE_ON_042A	 varchar(50),
SERVICE_UND_042B	 varchar(50),
STRUCTURE_KIND_043A varchar(50),
STRUCTURE_TYPE_043B  varchar(50),
APPR_KIND_044A	 varchar(50),
APPR_TYPE_044B	varchar(50),
MAX_SPAN_LEN_MT_048	 varchar(50),
STRUCTURE_LEN_MT_049	 varchar(50),
DECK_WIDTH_MT_052	varchar(50),
VERT_CLR_OVER_MT_053	 varchar(50),
DECK_COND_058	 varchar(50),
SUPERSTRUCTURE_COND_059	varchar(50),
INVENTORY_RATING_066	 varchar(50),
DECK_GEOMETRY_EVAL_068	varchar(50),
UNDCLRENCE_EVAL_069	 varchar(50),
WATERWAY_EVAL_071	 varchar(50),
WORK_PROPOSED_075A	 varchar(50),
WORK_DONE_BY_075B	 varchar(50),
IMP_LEN_MT_076	 varchar(50),
BRIDGE_IMP_COST_094 varchar(50),
YEAR_OF_IMP_097 varchar(50),
TRAFFIC_DIRECTION_102	varchar(50),
DECK_STRUCTURE_TYPE_107	varchar(50),
SURFACE_TYPE_108A	 varchar(50),
MEMBRANE_TYPE_108B	 varchar(50),
DECK_PROTECTION_108C	 varchar(50),
PERCENT_ADT_TRUCK_109	varchar(50),
NATIONAL_NETWORK_110	 varchar(50),
SCOUR_CRITICAL_113 varchar(50)
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/test_bridge.csv' into table TEST_BRIDGE
fields terminated by ','
optionally enclosed by '"' escaped by '"'
lines terminated by '\r\n';


/*creating table for Pearson coefficients for Question2*/
drop table if exists cost_correlation;				/*table to store correlations*/
create table if not exists cost_correlation(
FUNCTIONAL_CLASS_026c   	double,								
TRAFFIC_LANES_ON_028Ac  	double,
TRAFFIC_LANES_UND_028Bc 	double,
ADT_029c 					double,
DESIGN_LOAD_031c			double,
APPR_WIDTH_MT_032c 			double,
STRUCTURE_FLARED_035c  		double,
SERVICE_ON_042Ac 			double,
SERVICE_UND_042Bc 			double,
STRUCTURE_KIND_043Ac 		double,
STRUCTURE_TYPE_043Bc 		double,
APPR_KIND_044Ac				double,
APPR_TYPE_044Bc				double,
MAX_SPAN_LEN_MT_048c 		double,
STRUCTURE_LEN_MT_049c 		double,
DECK_WIDTH_MT_052c  		double,
VERT_CLR_OVER_MT_053c  		double,
DECK_COND_058c				double,
SUPERSTRUCTURE_COND_059c	double,
DECK_GEOMETRY_EVAL_068c  	double,
UNDCLRENCE_EVAL_069c		double,
WATERWAY_EVAL_071c			double,
WORK_PROPOSED_075Ac 		double,
WORK_DONE_BY_075Bc 			double,
IMP_LEN_MT_076c 			double,
YEAR_OF_IMP_097c			double,
DECK_STRUCTURE_TYPE_107c	double,
SCOUR_CRITICAL_113c			double				
);


/*creating table for Pearson coefficients for Question3*/
drop table if exists traffic_correlation;
create table if not exists traffic_correlation(
STATE_CODE_001t				double,
MIN_VERT_CLR_010t  			double,
DETOUR_KILOS_019t			double,
TOLL_020t  					double,
FUNCTIONAL_CLASS_026t  		double,
TRAFFIC_LANES_ON_028At 		double,
TRAFFIC_LANES_UND_028Bt 	double,
RAILINGS_036At 				double,
TRANSITIONS_036Bt 			double,
APPR_RAIL_036Ct 			double,
APPR_RAIL_END_036Dt 		double,
HISTORY_037t  				double,
SERVICE_ON_042At 			double,
SERVICE_UND_042Bt 			double,
INVENTORY_RATING_066t 		double,
TRAFFIC_DIRECTION_102t 		double,
SURFACE_TYPE_108At 			double,
PERCENT_ADT_TRUCK_109t 		double,
NATIONAL_NETWORK_110t 		double
);


/*calculate and create variables for calculations*/
select  sum(SERVICE_UND_042B), sum(pow(SERVICE_UND_042B)), sum(STRUCTURE_KIND_043A), sum(pow(STRUCTURE_KIND_043A,2)) from test_bridge;

select sum(APPR_WIDTH_MT_032), sum(pow(APPR_WIDTH_MT_032,2)) into @A032, @S032 from test_bridge;

select sum(STRUCTURE_FLARED_035), sum(pow(STRUCTURE_FLARED_035,2)), sum(SERVICE_ON_042A), sum(pow(SERVICE_ON_042A,2)), 
sum(SERVICE_UND_042B), sum(pow(SERVICE_UND_042B, 2)), sum(STRUCTURE_KIND_043A), sum(pow(STRUCTURE_KIND_043A,2)), 
sum(STRUCTURE_TYPE_043B), sum(pow(STRUCTURE_TYPE_043B,2)), sum(APPR_KIND_044A), sum(pow(APPR_KIND_044A,2)), 
sum(APPR_TYPE_044B), sum(pow(APPR_TYPE_044B,2)), sum(MAX_SPAN_LEN_MT_048), sum(pow(MAX_SPAN_LEN_MT_048,2)), 
sum(STRUCTURE_LEN_MT_049), sum(pow(STRUCTURE_LEN_MT_049,2)), sum(DECK_WIDTH_MT_052), sum(pow(DECK_WIDTH_MT_052,2)), 
sum(VERT_CLR_OVER_MT_053), sum(pow(VERT_CLR_OVER_MT_053,2)), sum(SUPERSTRUCTURE_COND_059), sum(pow(SUPERSTRUCTURE_COND_059,2)), 
sum(UNDCLRENCE_EVAL_069), sum(pow(UNDCLRENCE_EVAL_069,2)), sum(DECK_STRUCTURE_TYPE_107), sum(pow(DECK_STRUCTURE_TYPE_107,2))
into @A035,	@S035,@A042A,@S042A,@A042B,	@S042B,	@A043A,	@S043A,	@A043B,	@S043B,	@A044A,	@S044A,	@A044B,	@S044B,				
@A048,	 @S048,	 @A049,	 @S049,  @A052, @S052, @A053,@S053,	@A059,	 @S059,	@A069,	@S069,@A107, @S107
from TEST_BRIDGE;

select   sum(FUNCTIONAL_CLASS_026), sum(pow(FUNCTIONAL_CLASS_026,2)), sum(TRAFFIC_LANES_ON_028A), sum(pow(TRAFFIC_LANES_ON_028A,2)), 
sum(TRAFFIC_LANES_UND_028B), sum(pow(TRAFFIC_LANES_UND_028B,2)), sum(DESIGN_LOAD_031), sum(pow(DESIGN_LOAD_031,2))
into     @A026,						@S026,					     @A028A,					 @S028A,					   @A028B,						@S028B,						   @A031,				 @S031
from TEST_BRIDGE;




select sum(DECK_COND_058), sum(pow(DECK_COND_058,2)), sum(DECK_GEOMETRY_EVAL_068), sum(pow(DECK_GEOMETRY_EVAL_068,2)), sum(WATERWAY_EVAL_071), sum(pow(WATERWAY_EVAL_071,2)), 
sum(WORK_PROPOSED_075A), sum(pow(WORK_PROPOSED_075A,2)), sum(WORK_DONE_BY_075B), sum(pow(WORK_DONE_BY_075B,2)), sum(IMP_LEN_MT_076), sum(pow(IMP_LEN_MT_076,2)), sum(YEAR_OF_IMP_097), sum(pow(YEAR_OF_IMP_097,2)), 
sum(BRIDGE_IMP_COST_094), sum(pow(BRIDGE_IMP_COST_094,2)), sum(SCOUR_CRITICAL_113), sum(pow(SCOUR_CRITICAL_113,2))
into   @A058,			   @S058,				 @A068,						  @S068,						 
@A071,					 @S071,					   @A075A,					@S075A,					   @A075B,				   @S075B,					 @A076,				  @S076,				 
@A097,				   @S097,				   @A094,					 @S094,						 @A113,					  @S113
from TEST_BRIDGE;

select	sum(ADT_029), sum(pow(ADT_029,2))
into 	@A029,		  @S029
from TEST_BRIDGE;

select count(state_code_001) into @N from test_bridge;


#calculate and insert value into tables
insert into cost_correlation(
FUNCTIONAL_CLASS_026c,							
TRAFFIC_LANES_ON_028Ac,
TRAFFIC_LANES_UND_028Bc,
ADT_029c,
DESIGN_LOAD_031c,
APPR_WIDTH_MT_032c,
STRUCTURE_FLARED_035c,
SERVICE_ON_042Ac,
SERVICE_UND_042Bc,
STRUCTURE_KIND_043Ac,
STRUCTURE_TYPE_043Bc,
APPR_KIND_044Ac,
APPR_TYPE_044Bc,
MAX_SPAN_LEN_MT_048c,
STRUCTURE_LEN_MT_049c,
DECK_WIDTH_MT_052c,
VERT_CLR_OVER_MT_053c,
DECK_COND_058c,
SUPERSTRUCTURE_COND_059c,
DECK_GEOMETRY_EVAL_068c,
UNDCLRENCE_EVAL_069c,
WATERWAY_EVAL_071c,
WORK_PROPOSED_075Ac,
WORK_DONE_BY_075Bc,
IMP_LEN_MT_076c,
YEAR_OF_IMP_097c,
DECK_STRUCTURE_TYPE_107c,
SCOUR_CRITICAL_113c
)
VALUES(
	(select ( sum(BRIDGE_IMP_COST_094*FUNCTIONAL_CLASS_026) - @A094 * @A026 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S026 - pow(@A026,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * TRAFFIC_LANES_ON_028A ) - @A094 * @A028A/@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S028A - pow(@A028A,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * TRAFFIC_LANES_UND_028B) - @A094 * @A028B /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S028B - pow(@A028B,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * ADT_029 ) - @A094 * @A029 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S029 - pow(@A029,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * DESIGN_LOAD_031) - @A094 * @A031 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S031 - pow(@A031,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * APPR_WIDTH_MT_032 ) - @A094 * @A032 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S032 - pow(@A032,2)/@N) )
	from TEST_BRIDGE),
    
    (select ( sum(BRIDGE_IMP_COST_094 * STRUCTURE_FLARED_035) - @A094 * @A035 /@N )  /
    sqrt( (@S094 - pow(@A094,2)/@N) * (@S035 - pow(@A035,2)/@N) )
    from TEST_BRIDGE),

	(select ( sum(BRIDGE_IMP_COST_094 * SERVICE_ON_042A) - @A094 * @A042A /@N )  /
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S042A - pow(@A042A,2)/@N) )
	from TEST_BRIDGE),

	(select ( sum(BRIDGE_IMP_COST_094 * SERVICE_UND_042B) - @A094 * @A042B /@N )  /
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S042B - pow(@A042B,2)/@N) )
	from TEST_BRIDGE),

	(select ( sum(BRIDGE_IMP_COST_094 * STRUCTURE_KIND_043A) - @A094 * @A043A /@N )  /
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S043A - pow(@A043A,2)/@N) )
	from TEST_BRIDGE),

	(select ( sum(BRIDGE_IMP_COST_094 * STRUCTURE_TYPE_043B) - @A094 * @A043B /@N )  /
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S043B - pow(@A043B,2)/@N) )
	from TEST_BRIDGE),

	(select ( sum(BRIDGE_IMP_COST_094 * APPR_KIND_044A) - @A094 * @A044A /@N )  /
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S044A - pow(@A044A,2)/@N) )
	from TEST_BRIDGE),

	(select ( sum(BRIDGE_IMP_COST_094 * APPR_TYPE_044B) - @A094 * @A044B /@N )  /
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S044B - pow(@A044B,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * MAX_SPAN_LEN_MT_048) - @A094 * @A048 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S048 - pow(@A048,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * STRUCTURE_LEN_MT_049) - @A094 * @A049 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S049 - pow(@A049,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * DECK_WIDTH_MT_052) - @A094 * @A052 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S052 - pow(@A052,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * VERT_CLR_OVER_MT_053) - @A094 * @A053 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S053 - pow(@A053,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * DECK_COND_058) - @A094 * @A058 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S058 - pow(@A058,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * SUPERSTRUCTURE_COND_059) - @A094 * @A059 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S059 - pow(@A059,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * DECK_GEOMETRY_EVAL_068) - @A094 * @A068 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S068 - pow(@A068,2)/@N) )
	from TEST_BRIDGE),
	
    (select ( sum(BRIDGE_IMP_COST_094 * UNDCLRENCE_EVAL_069) - @A094 * @A069 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S069 - pow(@A069,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * WATERWAY_EVAL_071) - @A094 * @A071 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S071 - pow(@A071,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * WORK_PROPOSED_075A) - @A094 * @A075A /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S075A - pow(@A075A,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * WORK_DONE_BY_075B) - @A094 * @A075B /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S075B - pow(@A075B,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * IMP_LEN_MT_076) - @A094 * @A076 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S076 - pow(@A076,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * YEAR_OF_IMP_097) - @A094 * @A097 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S097 - pow(@A097,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * DECK_STRUCTURE_TYPE_107) - @A094 * @A107 /@N )  / 
	sqrt( (@S094 - pow(@A094,2)/@N) * (@S107 - pow(@A107,2)/@N) )
	from TEST_BRIDGE),
    
	(select ( sum(BRIDGE_IMP_COST_094 * SCOUR_CRITICAL_113) - @A094 * @A113 /@N )  / 
	sqrt( (@S094 - pow(@A094, 2)/@N) * (@S113 - pow(@A113,2)/@N) )
	from TEST_BRIDGE)
);
    
select * from cost_correlation;	
    
/*question 3, the factors affect traffic*/	

/*create variables to store the results of calculations*/
select ( sum(ADT_029 * DETOUR_KILOS_019) - @A029 * @A019 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S019 - pow(@A019,2)/@N) )
	from TEST_BRIDGE;

select 	sum(STATE_CODE_001), sum(pow(STATE_CODE_001,2)), sum(RAILINGS_036A), sum(pow(RAILINGS_036A,2)), sum(TRANSITIONS_036B), sum(pow(TRANSITIONS_036B,2)), sum(APPR_RAIL_036C), sum(pow(APPR_RAIL_036C,2)), sum(APPR_RAIL_END_036D), sum(pow(APPR_RAIL_END_036D,2)), sum(HISTORY_037), sum(pow(HISTORY_037,2)), sum(SERVICE_ON_042A), sum(pow(SERVICE_ON_042A,2)), sum(SERVICE_UND_042B), sum(pow(SERVICE_UND_042B,2)), sum(INVENTORY_RATING_066), sum(pow(INVENTORY_RATING_066,2))
into	@A001,				 @S001,					@A036A,				@S036A,				  @A036B,				 @S036B,				  @A036C,			   @S036C,				  @A036D,				   @S036D,					  @A037,			@S037,				@A042A,				  @S042A,				  @A042B,				 @S042B,				  @A066,					 @S066
from TEST_BRIDGE;
	
select	sum(MIN_VERT_CLR_010), sum(pow(MIN_VERT_CLR_010,2)), sum(DETOUR_KILOS_019), sum(pow(DETOUR_KILOS_019,2)), sum(TOLL_020), sum(pow(TOLL_020,2)), sum(FUNCTIONAL_CLASS_026), sum(pow(FUNCTIONAL_CLASS_026,2)), sum(TRAFFIC_LANES_ON_028A), sum(pow(TRAFFIC_LANES_ON_028A,2)), sum(TRAFFIC_LANES_UND_028B), sum(pow(TRAFFIC_LANES_UND_028B,2)), sum(TRAFFIC_DIRECTION_102), sum(pow(TRAFFIC_DIRECTION_102,2)), sum(SURFACE_TYPE_108A), sum(pow(SURFACE_TYPE_108A,2)), sum(NATIONAL_NETWORK_110), sum(pow(NATIONAL_NETWORK_110,2))
into    @A010,				   @S010,					@A019,				   @S019,					@A020,		   @S020,			@A026,					   @S026,						@A028A,						@S028A,						  @A028B,					   @S028B,						  @A102,					  @S102,						@A108A,					@S108A,					  @A110,					 @S110
from TEST_BRIDGE;

select sum(ADT_029), sum(pow(ADT_029,2)), sum(PERCENT_ADT_TRUCK_109),  sum(pow(PERCENT_ADT_TRUCK_109,2))
into   @A029,		 @S029,			 @A109,						  @S109
from 	TEST_BRIDGE;


/*calculate and insert value into tables*/
insert into traffic_correlation(
STATE_CODE_001t,
MIN_VERT_CLR_010t,
DETOUR_KILOS_019t,
TOLL_020t,
FUNCTIONAL_CLASS_026t,
TRAFFIC_LANES_ON_028At,
TRAFFIC_LANES_UND_028Bt,
RAILINGS_036At,
TRANSITIONS_036Bt,
APPR_RAIL_036Ct,
APPR_RAIL_END_036Dt,
HISTORY_037t,
SERVICE_ON_042At,
SERVICE_UND_042Bt,
INVENTORY_RATING_066t,
TRAFFIC_DIRECTION_102t,
SURFACE_TYPE_108At,
PERCENT_ADT_TRUCK_109t,
NATIONAL_NETWORK_110t
)
values(
	(select ( sum(ADT_029 * STATE_CODE_001) - @A029 * @A001 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S001 - pow(@A001,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * MIN_VERT_CLR_010) - @A029 * @A010 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S010 - pow(@A010,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * DETOUR_KILOS_019) - @A029 * @A019 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S019 - pow(@A019,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * TOLL_020) - @A029 * @A020 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S020 - pow(@A020,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * FUNCTIONAL_CLASS_026) - @A029 * @A026 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S026 - pow(@A026,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * TRAFFIC_LANES_ON_028A) - @A029 * @A028A /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S028A - pow(@A028A,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * TRAFFIC_LANES_UND_028B) - @A029 * @A028B /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S028B - pow(@A028B,2)/@N) )
	from TEST_BRIDGE),
    
     (select ( sum(ADT_029 * RAILINGS_036A) - @A029 * @A036A /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S036A - pow(@A036A,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * TRANSITIONS_036B) - @A029 * @A036B /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S036B - pow(@A036B,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * APPR_RAIL_036C) - @A029 * @A036C /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S036C - pow(@A036C,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * APPR_RAIL_END_036D) - @A029 * @A036D /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S036D - pow(@A036D,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * HISTORY_037) - @A029 * @A037 /@N )  / 
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S037 - pow(@A037,2)/@N) )
	from TEST_BRIDGE),
    
    (select ( sum(ADT_029 * SERVICE_ON_042A) - @A029 * @A042A /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S042A - pow(@A042A,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * SERVICE_UND_042B) - @A029 * @A042B /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S042B - pow(@A042B,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * INVENTORY_RATING_066) - @A029 * @A066 /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S066 - pow(@A066,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * TRAFFIC_DIRECTION_102) - @A029 * @A102 /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S102 - pow(@A102,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * SURFACE_TYPE_108A) - @A029 * @A108A /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S108A - pow(@A108A,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * PERCENT_ADT_TRUCK_109) - @A029 * @A109 /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S109 - pow(@A109,2)/@N) )
	from TEST_BRIDGE),

    (select ( sum(ADT_029 * NATIONAL_NETWORK_110) - @A029 * @A110 /@N )  /
	sqrt( (@S029 - pow(@A029,2)/@N) * (@S110 - pow(@A110,2)/@N) )
	from TEST_BRIDGE)
);

/*show the results for question 2 and 3*/
select * from cost_correlation;
select * from traffic_correlation;


select TRAFFIC_LANES_ON_028Ac,
TRAFFIC_LANES_UND_028Bc,
ADT_029c,
DESIGN_LOAD_031c,
APPR_WIDTH_MT_032c,
MAX_SPAN_LEN_MT_048c,
STRUCTURE_LEN_MT_049c,
DECK_WIDTH_MT_052c,
VERT_CLR_OVER_MT_053c,
DECK_COND_058c,
SUPERSTRUCTURE_COND_059c,
DECK_GEOMETRY_EVAL_068c,
UNDCLRENCE_EVAL_069c,
WATERWAY_EVAL_071c,
IMP_LEN_MT_076c,
YEAR_OF_IMP_097c,
SCOUR_CRITICAL_113c
from cost_correlation;

select MIN_VERT_CLR_010t,
DETOUR_KILOS_019t,
TRAFFIC_LANES_ON_028At,
TRAFFIC_LANES_UND_028Bt,
RAILINGS_036At,
TRANSITIONS_036Bt,
APPR_RAIL_036Ct,
APPR_RAIL_END_036Dt,
HISTORY_037t,
INVENTORY_RATING_066t,
PERCENT_ADT_TRUCK_109t
from traffic_correlation;



/*export the result for categorical attrinutes to .csv and use other programming language to do the plotting*/
select FUNCTIONAL_CLASS_026,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as FUNCTIONAL_CLASS_026table group by FUNCTIONAL_CLASS_026 order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FUNCTIONAL_CLASS_026.csv'
 FIELDS TERMINATED BY ','; 

select DECK_STRUCTURE_TYPE_107,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as DECK_STRUCTURE_TYPE_107table group by DECK_STRUCTURE_TYPE_107 order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/DECK_STRUCTURE_TYPE_107.csv'
 FIELDS TERMINATED BY ','; 

select SURFACE_TYPE_108A,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as SURFACE_TYPE_108Atable group by SURFACE_TYPE_108A order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SURFACE_TYPE_108A.csv'
 FIELDS TERMINATED BY ','; 

select APPR_KIND_044A,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as APPR_KIND_044Atable group by APPR_KIND_044A order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/APPR_KIND_044A.csv'
 FIELDS TERMINATED BY ','; 

select APPR_TYPE_044B,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as APPR_TYPE_044Btable group by APPR_TYPE_044B order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/APPR_TYPE_044B.csv'
 FIELDS TERMINATED BY ','; 

select STRUCTURE_KIND_043A,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as STRUCTURE_KIND_043Atable group by STRUCTURE_KIND_043A order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/STRUCTURE_KIND_043A.csv'
 FIELDS TERMINATED BY ','; 

select STRUCTURE_TYPE_043B,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as STRUCTURE_TYPE_043Btable group by STRUCTURE_TYPE_043B order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/STRUCTURE_TYPE_043B.csv'
 FIELDS TERMINATED BY ','; 

select STRUCTURE_FLARED_035,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as STRUCTURE_FLARED_035table group by STRUCTURE_FLARED_035 order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/STRUCTURE_FLARED_035.csv'
 FIELDS TERMINATED BY ','; 

select WORK_PROPOSED_075A,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as WORK_PROPOSED_075Atable group by WORK_PROPOSED_075A order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/WORK_PROPOSED_075A.csv'
 FIELDS TERMINATED BY ','; 

select WORK_DONE_BY_075B,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as WORK_DONE_BY_075Btable group by WORK_DONE_BY_075B order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/WORK_DONE_BY_075B.csv'
 FIELDS TERMINATED BY ','; 

select SERVICE_ON_042A,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as SERVICE_ON_042Atable group by SERVICE_ON_042A order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SERVICE_ON_042A.csv'
 FIELDS TERMINATED BY ','; 

select SERVICE_UND_042B,avg(BRIDGE_IMP_COST_094) from TEST_BRIDGE as SERVICE_UND_042Btable group by SERVICE_UND_042B order by avg(BRIDGE_IMP_COST_094) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SERVICE_UND_042B.csv'
 FIELDS TERMINATED BY ','; 
 
 
 select STATE_CODE_001,avg(ADT_029) from TEST_BRIDGE as STATE_CODE_001table group by STATE_CODE_001 order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/STATE_CODE_001.csv'
 FIELDS TERMINATED BY ','; 

select TOLL_020,avg(ADT_029) from TEST_BRIDGE as TOLL_020table group by TOLL_020 order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TOLL_020.csv'
 FIELDS TERMINATED BY ','; 

select FUNCTIONAL_CLASS_026,avg(ADT_029) from TEST_BRIDGE as FUNCTIONAL_CLASS_026table group by FUNCTIONAL_CLASS_026 order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/FUNCTIONAL_CLASS_026.csv'
 FIELDS TERMINATED BY ','; 

select SERVICE_ON_042A,avg(ADT_029) from TEST_BRIDGE as SERVICE_ON_042Atable group by SERVICE_ON_042A order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SERVICE_ON_042A.csv'
 FIELDS TERMINATED BY ','; 

select SERVICE_UND_042B,avg(ADT_029) from TEST_BRIDGE as SERVICE_UND_042Btable group by SERVICE_UND_042B order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SERVICE_UND_042B.csv'
 FIELDS TERMINATED BY ','; 

select TRAFFIC_DIRECTION_102,avg(ADT_029) from TEST_BRIDGE as TRAFFIC_DIRECTION_102table group by TRAFFIC_DIRECTION_102 order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/TRAFFIC_DIRECTION_102.csv'
 FIELDS TERMINATED BY ','; 

select SURFACE_TYPE_108A,avg(ADT_029) from TEST_BRIDGE as SURFACE_TYPE_108Atable group by SURFACE_TYPE_108A order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/SURFACE_TYPE_108A.csv'
 FIELDS TERMINATED BY ','; 

select NATIONAL_NETWORK_110,avg(ADT_029) from TEST_BRIDGE as NATIONAL_NETWORK_110table group by NATIONAL_NETWORK_110 order by avg(ADT_029) desc into outfile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/NATIONAL_NETWORK_110.csv'
 FIELDS TERMINATED BY ','; 




