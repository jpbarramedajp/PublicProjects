SELECT SU.*,IFNULL(SUM(TP.POINTS),0) AS POINTS, SCV.DESCRIPTION
FROM SYS_USER SU
LEFT JOIN SYS_USER_ROLE SUR ON SUR.USER_ID = SU.USER_ID
LEFT JOIN SYS_CODE_VALUE SCV ON SCV.CODE_ID = SUR.USER_GROUP_ID AND SCV.CODE_VALUE = SUR.USER_GROUP_VALUE
LEFT JOIN TRAN_POINT TP ON TP.USER_ID = SU.USER_ID
WHERE SU.USER_ID = ?
GROUP BY SU.USER_ID;