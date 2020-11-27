const Home = window.httpVueLoader('./components/Home.vue')
const Connexion = window.httpVueLoader('./components/connexion.vue')
const Register = window.httpVueLoader('./components/Register.vue')

const routes = [
    { path: '/', component: Home },
    { path: '/connexion', component: Connexion },
    { path: '/register', component: Register },
]

const router = new VueRouter({
    routes
})

var app = new Vue({
    router,
    el: '#app',
    data: {
        menu_state:false
    },
    methods: {
        async save(email, password) {
            const res = await axios.post('/api/register', { email: email, password: password })
            window.location.href = "#/"
        },
        async logUser(email, password) {
            try {
                const res = await axios.post('/api/connexion', { email: email, password: password })
                axios.get('/api/Avousdejouer').then(res =>this.ordinateurs = res.data)
                window.location.href = "#/"

            } catch (error) {
                alert("identifiants incorrects")
            }
            const res1 = await axios.get('/api/composant')
            this.composants = res1.data
        },

        CloseMenu(){
            this.menu_state=false;
        }
    }
})