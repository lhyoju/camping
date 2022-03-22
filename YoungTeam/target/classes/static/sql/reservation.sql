create table reserve (
resId varchar2(2500) primary key,
resDay date,
startDay date,
endDay date,
price number(36),
sitenum varchar2(250),
siteStatus number(38),
userid varchar2(2500),
resname varchar2(2500),
phone varchar2(2500),
carnum varchar2(2500),
carkinds varchar2(2500),
paymethod number(36),
paystatus number(36)
)


create table resDateMan(
resDateManId varchar2(2500),
resDate varchar2(2500),
sitenum varchar2(250),
userId varchar2(2500),
resid varchar2(2500),
resstatus number(6)
)

commit