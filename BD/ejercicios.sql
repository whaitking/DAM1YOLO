/* Mostrar toda la tabla */
SELECT * FROM EMP;
SELECT * FROM salgrade;
SELECT * FROM temple;
SELECT * FROM tcentr;
SELECT * FROM tdepto;

/* Ejercicios_SQL1 */
/* 1 */
SELECT ROWNUM, ENAME, JOB, SAL SALARY
FROM EMP;

/* 2 */
SELECT * 
FROM salgrade;

/* 3 */
SELECT SAL*12 "annual salary"
FROM emp;

/*4*/
SELECT * FROM dept;

/*5*/
SELECT EMPNO, ENAME, HIREDATE FROM emp;

/*6*/
SELECT JOB FROM emp;
/* 8 */
SELECT ENAME || ', ' || JOB AS "Nombre y trabajos"
 FROM emp;

 /* 9 */

SELECT
ENAME || ', ' || EMPNO ||', '|| JOB ||', '|| MGR ||', '|| HIREDATE ||', '|| SAL ||', '|| COMM ||', '|| DEPTNO
AS "separados por comas"
FROM EMP;

SELECT ENAME nombre, EMPNO numero, JOB trabajo, MGR manager, HIREDATE contrata, SAL salario, COMM bono, DEPTNO nºdep
FROM EMP;

/* sql2 */
/* 1 */
SELECT ENAME, SAL
FROM EMP
WHERE SAL > 2850;

/* 2 */
SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO IN (7566);

/* 3 */
SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 1500 AND 2850;

/* 4 */
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '20-FEB-1981' AND '01-MAY-1981'
ORDER BY HIREDATE ASC;

/* 5 */
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN ('10', '30')
ORDER BY ENAME ASC;

/* 6 */
SELECT ENAME Employee, SAL AS Monthly
FROM EMP
WHERE SAL > 1500 AND DEPTNO IN ('10', '30');

/* 7 */
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '01-JAN-1982' AND '31-DEC-1982';

/* 8 */
SELECT ENAME, JOB
FROM EMP
WHERE MGR IS NULL;

/* 9 */
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM > 0
ORDER BY SAL DESC, COMM DESC;

/* 10 */
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%';

/* 11 */
SELECT ENAME, DEPTNO, MGR
FROM EMP
WHERE ENAME LIKE '%L%L%' AND DEPTNO = 30 OR MGR = 7782;

/* 12 */
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN('CLERK', 'ANALYST') AND SAL NOT IN ('1000', '3000', '5000');

/* 13 */
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM > (SAL + SAL*0.10);

/* 14 */
SELECT NOMCE 
FROM TCENTR
ORDER BY NOMCE ASC;

/* 15 */
SELECT NOMEM,NUMDE
FROM TEMPLE
WHERE NUMDE = 121;

/* 16 */
SELECT * 
FROM TEMPLE
WHERE NUMDE = 121;

/* 17 */
SELECT NOMEM, SALAR, NUMHI
FROM TEMPLE
WHERE NUMHI > 3
ORDER by NOMEM ASC;

/* 18 */
SELECT NUMDE, COMIS, NOMEM, SALAR
FROM TEMPLE
WHERE SALAR < 880
ORDER BY NUMDE ASC, COMIS DESC;

/* 19 */
SELECT NOMDE, PRESU
FROM TDEPTO
WHERE PRESU > 100000
ORDER BY NOMDE ASC;

/* 20 */
SELECT DISTINCT NUMDE
FROM TEMPLE
WHERE SALAR < 1000;

/* 21 */
SELECT DISTINCT COMIS
FROM TEMPLE
WHERE NUMDE = 112;

/* 22 */
SELECT NOMDE, DIREC
FROM TDEPTO
WHERE TIDIR IN ('F')
ORDER BY NOMDE ASC;

/* 23 */
SELECT * FROM(
SELECT NOMEM, NUMEM, EXTEL
FROM TEMPLE
WHERE NUMDE = 121
ORDER BY NOMEM ASC
)WHERE ROWNUM <= 2;

/* 24 */
SELECT DISTINCT EXTEL 
FROM TEMPLE
ORDER by EXTEL ASC;

/* 25 */
SELECT NOMEM, COMIS, SALAR
FROM TEMPLE
WHERE NUMHI > 3
ORDER by COMIS, NOMEM ASC;

/* 26 */
SELECT SALAR, NOMEM
FROM TEMPLE
WHERE NUMHI = 0
ORDER BY SALAR DESC, NOMEM ASC;

/* 27 */
SELECT NOMEM, 166.3860*(SALAR*12) AS "Salario en Pesetas Anual"
FROM TEMPLE
WHERE NUMDE = 100 
ORDER by SALAR DESC;

/* 28 */
SELECT NOMEM, SALAR, COMIS
FROM TEMPLE
WHERE COMIS >= (SALAR*0.50)
ORDER BY NOMEM ASC;

/* 29 */
SELECT NOMEM, SALAR+100 AS "Salario Total mas Extra"
FROM TEMPLE
WHERE NUMHI >=4
ORDER BY NOMEM ASC;

/* 30 */
SELECT CONCAT('Departamento de: ',
              NOMDE) AS "Nombre de departamento"
FROM TDEPTO
WHERE PRESU < 1500000
ORDER BY NOMDE ASC;

/* 31 */
SELECT TRUNC(PRESU/12) AS "Presupuesto medio mensual", TRUNC((PRESU/12) + (PRESU/12)*0.10) AS "Presupuesto medio OCT,NOV,DEC", NOMDE,
TRUNC(PRESU/12) * 9 + (TRUNC((PRESU/12) + (PRESU/12)*0.10)*3) AS "Total + Incremento"
FROM TDEPTO
WHERE (PRESU/12) >= 30000
ORDER BY NOMDE ASC;

/* 32 */
SELECT NOMEM, NUMHI, SALAR AS "Salario Actual", 
Salar+SALAR*0.06 AS "Salario anual 1º año",
Salar+SALAR*0.12 AS "Salario anual 2º año",
Salar+SALAR*0.24 AS "Salario anual 3º año"
FROM TEMPLE
WHERE NUMHI > 4
ORDER BY NOMEM ASC;

/* 33 */
SELECT NOMEM, SALAR, COMIS, NUMDE,
SALAR + COMIS AS "Salario Total"
FROM TEMPLE
WHERE NUMDE = 112 
ORDER BY SALAR DESC, NOMEM ASC;

/* 34 */
SELECT NOMEM, SALAR, COMIS,
SALAR + COMIS AS "Salario Total"
FROM TEMPLE
WHERE SALAR + COMIS > 1500
ORDER by SALAR + COMIS ASC;

/* 35 */
SELECT NUMDE,SALAR, COMIS
FROM TEMPLE
WHERE COMIS > (SALAR*0.20);

/* 36 */
SELECT SALAR + COMIS AS "salario total", NOMEM, ROUND(COMIS/SALAR,3)*100 /* ||"%"|| */ AS "Porcentaje de comision"
FROM TEMPLE
WHERE COMIS IS NOT NULL    
ORDER BY NOMEM ASC;

/* 37 */
SELECT NOMDE
FROM TDEPTO
WHERE DEPDE IS NULL;

/* 38 */
SELECT NOMEM, SALAR
FROM TEMPLE
WHERE SALAR BETWEEN 900 AND 1450;

/* 39 */
SELECT NOMEM, SALAR, NUMHI
FROM TEMPLE
WHERE SALAR / NUMHI;

/* 40 */
SELECT NOMEM
FROM TEMPLE
WHERE NOMEM LIKE 'MORA%';

/* 41 */
SELECT NOMEM
FROM TEMPLE
WHERE NOMEM LIKE '%______,%';

/* 42 */