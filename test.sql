-- INSERT INTO dbo.AgcmTable (AGPO, AGITEM, AGPART, AGRUN, AGPMCOMMENTS, AGCPEXP) 
-- VALUES
-- ('621001225793', 2, '146W4663-519', 20, 'BURNDOWN', 'N'),
-- ('613000524557', 3, '145T1914-15', 6, 'BURNDOWN', 'N'),
-- ('613000531542', 1, '145T1914-16', 9, 'BURNDOWN', 'N'),
-- ('613000524555', 3, '145T1907-31', 906, 'BURNDOWN', 'N'),
-- ('613000527027', 1, '146T0012-9929', 53, 'BURNDOWN', 'N'),
-- ('621001192884', 6, '152W0203-151', 29, 'BURNDOWN', 'N'),
-- ('613000478981', 9, '146T1033-9240', 10, 'BURNDOWN', 'N'),
-- ('606002461282', 1, '272A1591-1', 92, 'BURNDOWN', 'N');


-- UPDATE dbo.AgcmTable SET AGPMCOMMENTS = 'BURNDOWN' 
-- WHERE AGPO = '612000614950'
-- AND AGITEM = 1
-- AND AGRUN =  14
-- ;

-- select top 10 * from AgwoTable;

-- select top 10 * from dbo.QueueInfo; 

-- SELECT * FROM AgcmTable WHERE AGPO = '613000529984';


-- DELETE FROM dbo.AgcmTable WHERE AGPO='613000524555' AND AGRUN=10;

--  SELECT 
--     (SELECT COUNT(OPREF) FROM RnopTable 
--        INNER JOIN RunsTable ON RUNREF = OPREF 
--        AND RUNNO = OPRUN 
--        WHERE RUNPKPURGED = 0 
--        AND OPCOMPDATE >= CAST(GETDATE() AS DATE)
--        GROUP BY OPCENTER) AS completed_jobs, 
--      (SELECT COUNT(OPREF) FROM RnopTable 
--        WHERE OPCOMPLETE = 0 
--        AND OPSCHEDDATE <= CAST(GETDATE() as DATETIME) + 30
--        GROUP BY OPCENTER) AS daily_goal, OPCENTER FROM RnopTable GROUP BY OPCENTER;
 
--  select * from agwoTable;

-- SELECT rt.RUNREF, rt.RUNNO, rt.RUNCOMPLETE, rt.RUNQTY, rt.RUNOPCUR, rt.RUNPRIORITY, rt.RUNRTNUM, rnop.OPCENTER, rnop.OPCOMPDATE, rnop.OPINSP
-- FROM dbo.RunsTable as rt
-- LEFT JOIN dbo.RnopTable AS rnop ON rt.RUNREF = rnop.OPREF AND rt.RUNNO = rnop.OPRUN
-- ORDER BY ;



