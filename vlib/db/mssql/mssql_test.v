import db.mssql

fn test_mssql() {
	config := mssql.Config{
		driver: 'ODBC Driver 18 for SQL Server'
		server: 'localhost'
		uid: 'sa'
		pwd: '^5u&JR58^*'
		dbname: 'TestDB'
	}

	mut conn := mssql.Connection{
		henv: unsafe { nil }
		hdbc: unsafe { nil }
	}

	conn.connect('Driver={ODBC Driver 18 for SQL Server};Server=localhost;Database=TestDB;Uid:sa;Pwd=^5u&JR58^*;')!
	defer {
		conn.close()
	}

	println('hello')
}
