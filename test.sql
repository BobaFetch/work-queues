-- INSERT INTO dbo.AgcmTable (AGPO, AGITEM, AGPART, AGRUN, AGPMCOMMENTS, AGCPEXP) 
-- VALUES
-- ('609000942780', 7, '232W4509-11', 90, 'BURNDOWN ETRAC(9/22)', 'N'),
-- ('613000527197', 2, '146T5619-339 IMA1', 17, 'BURNDOWN ETRAC(9/28)', 'N'),
-- ('613000527197', 2, '146T5650-9600', 35, 'BURNDOWN ETRAC(9/28)', 'N');


-- UPDATE dbo.AgcmTable SET AGPMCOMMENTS = 'BURNDOWN ETRAC(9/28)' 
-- WHERE AGPO = '613000527197'
-- AND AGITEM = 2
-- ;

-- SELECT * FROM dbo.RnopTable 
--   WHERE OPCENTER = '1600'
--   AND OPCOMPDATE >= CAST('2021-09-22 00:00:00' AS smalldatetime);

-- SELECT * FROM dbo.RnopTable
-- WHERE OPREF = '295W100411' AND OPRUN = 24;
