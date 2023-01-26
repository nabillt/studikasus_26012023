//iniaili library
const express = require("express")
const bodyParser = require("body-parser")
const cors = require("cors")
const mysql = require("mysql")


// implementasi

const app = express()
app.use(cors())
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

// create MySQL Connection
const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "sewa_kendaraan"
})

db.connect(error => {
    if (error) {
        console.log(error.message)
    } else {
        console.log("MySQL Connected")
    }
})



// end-point akses data penyewa
app.get("/penyewa", (req, res) => {
    // create sql query
    let sql = "select * from data_penyewa"

    // run query
    db.query(sql, (error, result) => {
        let response = null
        if (error) {
            response = {
                message: error.message // pesan error
            }
        } else {
            response = {
                count: result.length, // jumlah data
                data_penyewa: result // isi data
            }
        }
        res.json(response) // send response
    })
})

// end-point akses data siswa berdasarkan id_penyewa tertentu
app.get("/penyewa/:id", (req, res) => {
    let data = {
        id_penyewa: req.params.id
    }
    // create sql query
    let sql = "select * from data_penyewa where ?"

    // run query
    db.query(sql, data, (error, result) => {
        let response = null
        if (error) {
            response = {
                message: error.message // pesan error
            }
        } else {
            response = {
                count: result.length, // jumlah data
                data_penyewa: result // isi data
            }
        }
        res.json(response) // send response
    })
})

// end-point menyimpan 
app.post("/penyewa", (req, res) => {

    // prepare data
    let data = {
        nama_penyewa: req.body.nama_penyewa,
        alamat_penyewa: req.body.alamat_penyewa
    }

    // create sql query insert
    let sql = "insert into data_penyewa set ?"

    // run query
    db.query(sql, data, (error, result) => {
        let response = null
        if (error) {
            response = {
                message: error.message
            }
        } else {
            response = {
                message: result.affectedRows + " data inserted"
            }
        }
        res.json(response) // send response
    })
})

// end-point mengubah data penyewa
app.put("/penyewa", (req, res) => {

    // prepare data
    let data = [
        // data
        {
            nama_penyewa: req.body.nama_penyewa,
            alamat_penyewa: req.body.alamat_penyewa
        },

        // parameter (primary key)
        {
            id_penyewa: req.body.id_penyewa
        }
    ]

    // create sql query update
    let sql = "update data_penyewa set ? where ?"

    // run query
    db.query(sql, data, (error, result) => {
        let response = null
        if (error) {
            response = {
                message: error.message
            }
        } else {
            response = {
                message: result.affectedRows + " data updated"
            }
        }
        res.json(response) // send response
    })
})

// end-point menghapus data penyewa berdasarkan id_penyewa
app.delete("/penyewa/:id", (req, res) => {
    // prepare data
    let data = {
        id_penyewa: req.params.id
    }

    // create query sql delete
    let sql = "delete from data_penyewa where ?"

    // run query
    db.query(sql, data, (error, result) => {
        let response = null
        if (error) {
            response = {
                message: error.message
            }
        } else {
            response = {
                message: result.affectedRows + " data deleted"
            }
        }
        res.json(response) // send response
    })
})

app.listen(8000, () => {
    console.log("Run on port 8000")
})