// Full Parts List
import sql from 'mssql';
import { config } from '$lib/db';

async function sqlCmd(sqlQuery) {
	await sql.connect(config);

	const result = await sql.query(sqlQuery);

	let data = result.recordset;

	return data;
}

export async function getPartsList() {
	const query = `SELECT DISTINCT PARTREF, PARTNUM
							 	FROM PartTable
								INNER JOIN MrplTable ON MrplTable.MRP_PARTREF = PartTable.PARTREF
								WHERE PAINACTIVE = 0 AND PAOBSOLETE = 0
								ORDER BY PARTREF;`;
	let data = await sqlCmd(query);

	return data;
	// Putting SQL statements as a placeholder until I figure out how to organize this shit
	// SELECT DISTINCT PARTREF, PARTNUM
	//   FROM PartTable
	//   INNER JOIN MrplTable ON MrplTable.MRP_PARTREF = PartTable.PARTREF
	//   WHERE PAINACTIVE = 0 AND PAOBSOLETE = 0
	//   ORDER BY PARTREF;
	// -------------------------------------------------------------
	// |         PARTREF           |             PARTNUM           |
	// |-----------------------------------------------------------|
	// |   .032TEFLONSHEETETCHED   |   .032 TEFLON SHEET ETCHED    |
	// |-----------------------------------------------------------|
	// |       00058695001         |           00058695-001        |
	// |-----------------------------------------------------------|
}
