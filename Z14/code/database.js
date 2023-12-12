function uuidv4() { // Public Domain/MIT
    var d = new Date().getTime();//Timestamp
    var d2 = ((typeof performance !== 'undefined') && performance.now && (performance.now()*1000)) || 0;//Time in microseconds since page-load or 0 if unsupported
    return 'xxxxxxxxxxxx4xxxyxxxxxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
        var r = Math.random() * 16;//random number between 0 and 16
        if(d > 0){//Use timestamp until depleted
            r = (d + r)%16 | 0;
            d = Math.floor(d/16);
        } else {//Use microseconds since page-load if supported
            r = (d2 + r)%16 | 0;
            d2 = Math.floor(d2/16);
        }
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}

function now() {
    var objToday = new Date(),
        weekday = new Array('Воскресенье', 'Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота'),
        dayOfWeek = weekday[objToday.getDay()],
        dayOfMonth = ( objToday.getDate() < 10) ? '0' + objToday.getDate() : objToday.getDate(),
        months = new Array('Января', 'Февраля', 'Марта', 'Апреля', 'Мая', 'Июня', 'Июля', 'Августа', 'Сентября', 'Октября', 'Ноября', 'Декабря'),
        curMonth = months[objToday.getMonth()],
        curYear = objToday.getFullYear(),
        curHour = objToday.getHours(),
        curMinute = objToday.getMinutes() < 10 ? "0" + objToday.getMinutes() : objToday.getMinutes(),
        curSeconds = objToday.getSeconds() < 10 ? "0" + objToday.getSeconds() : objToday.getSeconds();
    var today =  curHour + ":" + curMinute + ":" + curSeconds + " " + dayOfWeek + " " + dayOfMonth + "  " + curMonth + ", " + curYear;
    return today
}

function dbInit()
{
    var db = LocalStorage.openDatabaseSync("Note_DB", "", "Notes", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS words (id text primary key,word text,date text)')
            tx.executeSql('CREATE TABLE IF NOT EXISTS translations (id_word text,translation text)')
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
            tx.executeSql('DROP TABLE translations')
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

function dbInsertWordAndTranslation(word, listTranslations)
{
    var db = dbGetHandle()
    db.transaction(function (tx) {
        var id = uuidv4()
        var date = now()

        tx.executeSql('INSERT INTO words VALUES(?, ?, ?)',
                      [id, word, date])

        for (let i = 0; i < listTranslations.length; i++){
            tx.executeSql('INSERT INTO translations VALUES(?, ?)',
                        [id, listTranslations[i]])
        }
    })
}

function dbGetAllUUID()
{
    var db = dbGetHandle()
    var list = []
    db.transaction(function (tx) {
        var results = tx.executeSql('SELECT id FROM words')
        for (var i = 0; i < results.rows.length; i++) {
            list.push(results.rows.item(i).id)
        }
    })
    return list
}

function dbGetTranslateForUUID(uuid)
{
    var db = dbGetHandle()
    var list = []
    db.transaction(function (tx) {
        var results = tx.executeSql('SELECT translation FROM translations WHERE id_word=\''+ uuid.toString() + "\'")
        for (var i = 0; i < results.rows.length; i++) {
            list.push(results.rows.item(i).translation)
        }
        
    })
    return list
}

function getWordByUUID(uuid) {
    var db = dbGetHandle()
    var myWord = ""
    db.transaction(function (tx) {
        var results = tx.executeSql('SELECT word FROM words WHERE id=\''+ uuid.toString() + "\'")
        myWord = results.rows.item(0).word
    })
    return myWord
}

function getDateByUUID(uuid) {
    var db = dbGetHandle()
    var myDate = ""
    db.transaction(function (tx) {
        var results = tx.executeSql('SELECT date FROM words WHERE id=\''+ uuid.toString() + "\'")
        myDate = results.rows.item(0).date
    })
    return myDate
}

function getWordByLetter(str) {
    var db = dbGetHandle()
    var list = []
    db.transaction(function (tx) {
        var results = tx.executeSql('SELECT id FROM words WHERE word LIKE \'' + str.toString() + '%\'')
        for (var i = 0; i < results.rows.length; i++) {
            list.push(results.rows.item(i).id)
        }
    })
    return list
}