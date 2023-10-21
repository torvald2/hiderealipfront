<template>
  <div id="app">
    <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">Hide  Real IP Address</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Fast and Secure proxy on the Web3 Rails</p>
                </div>
                <b-button class="mt-2" size="lg" @click="connectWalllet">{{connect}}</b-button>

            </div>
        </header>
    <router-view/>
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  name: 'App',
  data(){
     return {
        account:""
     }
  },
  methods:{
    async connectWalllet(){
      await window.ethereum.request({method: 'eth_requestAccounts'});
      let acoounts = await window.ethereum.request({
          method: 'eth_requestAccounts',
        })
      this.account = acoounts[0]
      
    }
  },
  computed:{
    connect(){
      if (this.account==="") {
        return `Connect Wallet`
      } else {
        return `✔ ...${this.account.slice(-4)}`
      }
    }
  }
}
</script>


<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
