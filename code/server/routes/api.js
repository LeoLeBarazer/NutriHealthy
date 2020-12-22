const express = require('express')
const router = express.Router()

const bcrypt = require('bcrypt')
const { Client } = require('pg')
const client = new Client({
    user: 'postgres',
    host: 'localhost',
    password: 'mdpsuperuser',
    database: 'NutriHealthy'
})
client.connect()




/**
 * Connection
 */
async function save(email, password) {
    const sql = "INSERT INTO users (email, password) VALUES ($1, $2) RETURNING *"
    return await client.query({
        text: sql,
        values: [email, password]
    })
}

async function verifmail(email) {
    return await client.query({
        text: "SELECT * FROM users WHERE email=$1",
        values: [email]
    })
}

async function verifIdentifiants(email, password) {
    return await client.query({
        text: "SELECT * FROM users WHERE email=$1 AND password=$2",
        values: [email, password]
    })
}


router.post('/register', (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    if (typeof email !== 'string' || email === '' ||
        typeof password !== 'string' || password === '') {
        res.status(400).json({ message: 'bad request' })
        return
    }

    verifmail(email).then(result => {
        if (result.rowCount >= 1) {
            res.status(500).json({ message: 'mail deja utilisé' })
        }

        bcrypt.hash(password, 10).then(hash => {
            save(email, hash).then(resultInsert => {
                res.json({ email: resultInsert.rows[0].email })
            })
        })
    })
})

router.post('/connexion', (req, res) => {
    const email = req.body.email;
    const password = req.body.password;

    if (typeof email !== 'string' || email === '' ||
        typeof password !== 'string' || password === '') {
        res.status(400).json({ message: 'bad request' })
        return
    }


    verifmail(email).then(result => {
        if (result.rowCount <= 0) {
            res.status(500).json({ message: 'identifiants incorrectes' })
            return
        }

        const MDP = result.rows[0].password;
        bcrypt.compare(password, MDP).then(accepte => {
            if (accepte) {
                req.session.userId = result.rows[0].id
                res.send()
            } else {
                res.status(500).json({ message: 'identifiants incorrectes' })
            }
        })
    })
})

/**
 * Sport
 */

 //Creer une activité
 router.post('/asport', async(req, res) => {
    // récuperer l'information
    const activite = req.body.activite;
    const temps = req.body.temps;
    const calories = req.body.calories;

    //verifie la fiabilité de l'info
    if (typeof activite !== 'string' || activite === '' ||
        isNaN(temps)||
        isNaN(calories)) {
        res.status(400).json({ message: 'bad request' })
        return
    }
    // verifie si utilisateur connecté
    if (req.session.userId === undefined) {
        res.status(401).json({ message: 'Unauthorized' })
        return
    }

    // ajouter le composant
    let result = await client.query({
        text: "INSERT INTO sports (activite, temps, calories) VALUES ($1, $2, $3) RETURNING *",
        values: [activite, temps, calories]
    })

    // reenvoyer une reponse au client
    res.json(result.rows[0])
})

//Creer une nouriture
router.post('/arepas', async(req, res) => {
    // récuperer l'information
    const ingredient = req.body.ingredient;
    const quantite = req.body.quantite;
    const calories = req.body.calories;

    //verifie la fiabilité de l'info
    if (typeof ingredient !== 'string' || ingredient === '' ||
        isNaN(quantite)||
        isNaN(calories)) {
        res.status(400).json({ message: 'bad request' })
        return
    }

    // verifie si utilisateur connecté
    if (req.session.userId === undefined) {
        res.status(401).json({ message: 'Unauthorized' })
        return
    }

    // ajouter le composant
    let result = await client.query({
        text: "INSERT INTO nourritures (ingredient, quantite, calories) VALUES ($1, $2, $3) RETURNING *",
        values: [ingredient, quantite, calories]
    })

    // reenvoyer une reponse au client
    res.json(result.rows[0])
})


//Gérrer le suivit
router.get('/suivit', async(req, res) => {
    // verifie si utilisateur connecté
    if (req.session.userId === undefined) {
        res.status(401).json({ message: 'Unauthorized' })
        return
    }

    // reenvoyer une reponse au client
    let result = await client.query({
        text: "SELECT * FROM users WHERE id=$1",
        values:[req.session.userId]
    })

    res.json(result.rows)
})

router.get('/', async(req, res) => {
    // verifie si utilisateur connecté
    if (req.session.userId === undefined) {
        res.status(401).json({ message: 'Unauthorized' })
        return
    }

    // reenvoyer une reponse au client
    let result = await client.query({
        text: "SELECT * FROM sports",
    })

    let Result = await client.query({
        text: "SELECT * FROM nourritures",
    })

    BigTab=[result.rows, Result.rows]
    console.log(BigTab);
    res.json(BigTab)
    


})

module.exports = router