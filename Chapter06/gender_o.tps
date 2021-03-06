execute drop_if_exists('table','GENDER_OT');
execute drop_if_exists('view','GENDER_OV');
execute drop_if_exists('type','GENDER_O');
create TYPE GENDER_O as object (
/*
gender_o.tps
by Don Bales on 12/15/2006
Type GENDER's attributes and methods.
*/
id                                    number,
code                                  varchar2(30),
description                           varchar2(80),
active_date                           date,
inactive_date                         date,
/*
A constructor for creating a new instance of type GENDER_O with NULL 
values.
*/
CONSTRUCTOR FUNCTION gender_o(
self                           in out gender_o)
return                                self as result,
/*
A constructor for creating a new instance of type GENDER_O for insert.
*/
CONSTRUCTOR FUNCTION gender_o(
self                           in out gender_o,
aiv_code                              varchar2,
aiv_description                       varchar2)
return                                self as result,
/*
Gets the code and decription values for the specified id.
*/
STATIC PROCEDURE get_code_descr(
ain_id                         in     number,
aov_code                          out varchar2,
aov_description                   out varchar2),
/*
Verifies that the passed code value is an exact or like match on the 
date specified.  
*/
STATIC PROCEDURE get_code_id_descr(
aiov_code                      in out varchar2,
aon_id                            out number,
aov_description                   out varchar2,
aid_on                         in     date),
/*
Verifies that the passed code value is currently an exact or like match.  
*/
STATIC PROCEDURE get_code_id_descr(
aiov_code                      in out varchar2,
aon_id                            out number,
aov_description                   out varchar2),
/*
Returns a new primary key id value for a row.
*/
MEMBER FUNCTION get_id
return                                number,
/*
Returns the id for the specified code value.
*/
STATIC FUNCTION get_id(
aiv_code                       in     varchar2) 
return                                number,
/*
Test-based help for this package.  "set serveroutput on" in SQL*Plus.
*/
STATIC PROCEDURE help,
/*
Test units for this package.  
*/
STATIC PROCEDURE test,
/*
A MAP function for sorting at the object level. 
*/
MAP MEMBER FUNCTION to_varchar2
return                                varchar2
);
/
@se.sql GENDER_O
