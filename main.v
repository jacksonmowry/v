module main

import db.mysql

fn main() {
	mut connection := mysql.Connection{
		username: 'root'
		dbname: 'mysql'
	}
	connection.connect()!
	connection.select_db('db_users')!
	users := connection.query('SELECT * FROM users')!
	rows := users.rows()
	if rows.len == 0 {
		println('empty')
	} else {
		println(rows)
	}
}

// rows returns array of rows, each containing an array of values,
// one for each column.
pub fn (r Result) rows() []Row {
	// NEW CODE HERE
	if r == mysql.Result{} {
		return []Row{}
	}
	// NEW CODE HERE

	mut rows := []Row{}
	nr_cols := r.n_fields()
	for rr := r.fetch_row(); rr; rr = r.fetch_row() {
		mut row := Row{}
		for i in 0 .. nr_cols {
			if unsafe { rr[i] == 0 } {
				row.vals << ''
			} else {
				row.vals << mystring(unsafe { &u8(rr[i]) })
			}
		}
		rows << row
	}
	return rows
}
