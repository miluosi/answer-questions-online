<template>
    <div class="mcontaner">
        <Header></Header>
        <div class="block">
            <el-timeline>
                <el-timeline-item :timestamp="que.created" placement="top" v-for="que in questions">
                    <el-card>
                        <h4>
                            <div v-if="level>=que.qslevel">
                                <router-link :to="{name: 'Questionsolve', params: {questionId: que.id}}">
                                    {{que.content}}
                                </router-link>
                            </div>
                            <div v-else>
                                {{que.content}}
                            </div>
                        </h4>
                        <h5>
                            {{que.type}}
                        </h5>
                    </el-card>
                </el-timeline-item>
            </el-timeline>
            <el-backtop target=".page-component__scroll .el-scrollbar__wrap"></el-backtop>
        </div>
    </div>
</template>

<script>
    import Header from "../components/Header";
    import SideMenu from "./inc/SideMenu";

    export default {
        name: "reco.vue",
        components: {Header,SideMenu},
        data() {
            return {
                user: {
                    username: '请先登录',
                    avatar: "https://tse1-mm.cn.bing.net/th/id/R-C.0f279cf9646f3d4b4f715d5c016ca6f0?rik=k2IkQYKSqnRKXQ&riu=http%3a%2f%2fpic17.nipic.com%2f20111112%2f6313940_154735194120_2.jpg&ehk=AYmN3ZSBwG1Gvi6p7TjVMbpRBCEDcU3o8wIsa1m2OhM%3d&risl=&pid=ImgRaw&r=0",
                    userlevel:''
                },
                level:'',
                finish:'',
                questions: {},
                currentPage: 1,
                total: 0,
                pageSize: 5
            }
        },
        methods: {
            page(currentPage) {
                const _this = this
                _this.$axios.get("/m-question/list?currentPage=" + currentPage).then(res => {
                    _this.questions = res.data.data.records
                })
            },
        },
        created() {
            const _this = this
            this.page(1)
            if(this.$store.getters.getUser.username) {
                this.user.username = this.$store.getters.getUser.username
                this.user.avatar = "https://tse1-mm.cn.bing.net/th/id/R-C.8bc4a0f7276a0a788c248b39e8aa6b72?rik=eXQPjk%2fTIyTWLA&riu=http%3a%2f%2fpic.gerenjianli.com%2fxiaohui2046%2fb19.jpg&ehk=ycyFB%2fS2QK4tmRVY8tH6ixq1L3VQk62ubJ0ZLaJBuDQ%3d&risl=&pid=ImgRaw&r=0"
                this.user.studentid = this.$store.getters.getUser.studentid
                this.hasLogin = true
            }
            this.$axios.get('/qsnum/getinfo/'+this.user.studentid).then((res)=> {
                console.log(res.data.data)
                console.log(res.data.data.qslist)
                console.log(res.data.data.userlist)
                console.log(res.data.data.qsre)
                this.questions = res.data.data.qsre
            })
        },
    }
</script>

<style scoped>

    .mpage {
        margin: 0 auto;
        text-align: center;
    }

</style>
