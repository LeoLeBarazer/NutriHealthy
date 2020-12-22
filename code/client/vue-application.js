const Home = window.httpVueLoader('./components/Home.vue')
const Connexion = window.httpVueLoader('./components/connexion.vue')
const Register = window.httpVueLoader('./components/Register.vue')
const Suivit = window.httpVueLoader('./components/Suivit.vue')
const ASport = window.httpVueLoader('./components/ASport.vue')
const ARepas = window.httpVueLoader('./components/ARepas.vue')

const routes = [
    { path: '/', component: Home },
    { path: '/connexion', component: Connexion },
    { path: '/register', component: Register },
    { path: '/suivit', component: Suivit },
    { path: '/asport', component: ASport },
    { path: '/arepas', component: ARepas },
]

const router = new VueRouter({
    routes
})

var app = new Vue({
    router,
    el: '#app',
    data: {
        nourritures: [],
        sports: [],
        demiJ: [[]],
        menu_state:false
    },
    async mounted() {
        axios.get('/api/suivit').then(res =>this.demiJ = res.data),
        axios.get('/api/').then(res =>{
            let Bigtab = res.data
            this.sports = Bigtab[0]
            this.nourritures = Bigtab[1]
            console.log(this.sports),
            console.log(this.nourritures)})
    },
    methods: {
        async save(email, password) {
            const res = await axios.post('/api/register', { email: email, password: password })
            window.location.href = "#/"
        },
        async logUser(email, password) {
            try {
                const res = await axios.post('/api/connexion', { email: email, password: password })
                window.location.href = "#/"

            } catch (error) {
                alert("identifiants incorrects")
            }
        },
        async AddSport(sport) {
            console.log(sport);
            const res = await axios.post('/api/asport', sport)
            this.sports.push(res.data)
        },
        async AddNourritures(nourriture) {
            console.log(nourriture);
            const res = await axios.post('/api/arepas', nourriture)
            this.nourritures.push(res.data)
        },

        CloseMenu(){
            this.menu_state=false;
        }
    }
})