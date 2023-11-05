function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Note_DB", "", "Notes", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS note_table (name text,price integer)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbDelete()
{
    var db = LocalStorage.openDatabaseSync("Note_DB", "", "Notes", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('DROP TABLE note_table')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle()
{
    try {
        var db = LocalStorage.openDatabaseSync("Note_DB", "",
                                               "Notes", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsert(Pdate, Pdesc)
{
    var db = dbGetHandle()
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO note_table VALUES(?, ?)',
                      [Pdate, Pdesc])
        var result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
    })
    return rowid;
}

function dbReadAll()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var results = tx.executeSql(
                    'SELECT rowid,name,price FROM note_table order by rowid desc')
        for (var i = 0; i < results.rows.length; i++) {
            noteModel.append({
                                 rowid: results.rows.item(i).rowid,
                                 name: results.rows.item(i).name,
                                 price: results.rows.item(i).price.toString()
                             })
        }
    })
}

function dbSum()
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var result = tx.executeSql(
                    'SELECT SUM(price) AS tpSum FROM note_table')
        var rez = result.rows.item(0).tpSum
        if (rez != null) sum.text = result.rows.item(0).tpSum.toString()
    })
}

function dbDeleteOne(index)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('DELETE FROM note_table WHERE rowid=' + index.toString())
    })
}
