import sql from 'mssql'
import { config } from '$lib/db'

export async function post(req) {
    let {part_number, run, po_num, item, comments, exp } = await req.body
    await sql.connect(config)

    console.log(req.body)

    let result = await sql.query(`
        INSERT INTO dbo.AgcmTable(AGPO, AGITEM, AGPART, AGRUN, AGPMCOMMENTS, AGCPEXP)
        VALUES('${po_num}', '${item}', '${part_number}', '${run}', '${comments}', '${exp}')
    `)

    let data = result.rowsAffected
    return {
        headers: {
            'content-type': 'application/json'
        },
        body: {
            message: req.body
        }
    }
}