ORDS:

Connect to VBCS Schema - VB_VB_EWQCM44QFWH

CREATE USER testuser1 IDENTIFIED BY "Pkug@18112020";
GRANT UNLIMITED TABLESPACE TO testuser1 WITH ADMIN OPTION;
GRANT CREATE SESSION, CREATE TABLE, CREATE TYPE TO testuser1;

CREATE TABLE EMP (
  EMPNO NUMBER(4,0), 
  ENAME VARCHAR2(10 BYTE), 
  JOB VARCHAR2(9 BYTE), 
  MGR NUMBER(4,0), 
  HIREDATE DATE, 
  SAL NUMBER(7,2), 
  COMM NUMBER(7,2), 
  DEPTNO NUMBER(2,0), 
  CONSTRAINT PK_EMP PRIMARY KEY (EMPNO)
  );
  
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7369,'SMITH','CLERK',7902,to_date('17-DEC-80','DD-MON-RR'),800,null,20);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7499,'ALLEN','SALESMAN',7698,to_date('20-FEB-81','DD-MON-RR'),1600,300,30);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7521,'WARD','SALESMAN',7698,to_date('22-FEB-81','DD-MON-RR'),1250,500,30);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7566,'JONES','MANAGER',7839,to_date('02-APR-81','DD-MON-RR'),2975,null,20);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7654,'MARTIN','SALESMAN',7698,to_date('28-SEP-81','DD-MON-RR'),1250,1400,30);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7698,'BLAKE','MANAGER',7839,to_date('01-MAY-81','DD-MON-RR'),2850,null,30);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7782,'CLARK','MANAGER',7839,to_date('09-JUN-81','DD-MON-RR'),2450,null,10);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7788,'SCOTT','ANALYST',7566,to_date('19-APR-87','DD-MON-RR'),3000,null,20);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7839,'KING','PRESIDENT',null,to_date('17-NOV-81','DD-MON-RR'),5000,null,10);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7844,'TURNER','SALESMAN',7698,to_date('08-SEP-81','DD-MON-RR'),1500,0,30);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7876,'ADAMS','CLERK',7788,to_date('23-MAY-87','DD-MON-RR'),1100,null,20);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7900,'JAMES','CLERK',7698,to_date('03-DEC-81','DD-MON-RR'),950,null,30);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7902,'FORD','ANALYST',7566,to_date('03-DEC-81','DD-MON-RR'),3000,null,20);
insert into EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO) values (7934,'MILLER','CLERK',7782,to_date('23-JAN-82','DD-MON-RR'),1300,null,10);
commit;

BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'ADMIN',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'admin',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;
/

BEGIN
  ORDS.enable_schema(
    p_enabled             => TRUE,
    p_schema              => 'VB_VB_EWQCM44QFWH',
    p_url_mapping_type    => 'BASE_PATH',
    p_url_mapping_pattern => 'vbcs',
    p_auto_rest_auth      => FALSE
  );
    
  COMMIT;
END;
/

https://PNDVTMYN7KJZJAU-DB202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin

BEGIN
  ORDS.define_service(
    p_module_name    => 'rest-v1',
    p_base_path      => 'rest-v1/',
    p_pattern        => 'employees/',
    p_method         => 'GET',
    p_source_type    => ORDS.source_type_collection_feed,
    p_source         => 'SELECT * FROM emp',
    p_items_per_page => 0);

  COMMIT;
END;
/

http://PNDVTMYN7KJZJAU-DB202011180647.adb.ap-hyderabad-1.oraclecloudapps.com/ords/admin/rest-v1/employees/
