<template>
    <div class="mcontaner">
        <Header1></Header1>
        <div class="block">
            <el-timeline>
                <el-timeline-item :timestamp="que.created" placement="top" v-for="que in questions">
                    <el-card>
                        <h3>
                            {{que.type}}
                        </h3>
                        <h4>
                            <router-link :to="{name: 'Alknowledge', params: {knowledgeId: que.id}}">
                                {{que.content}}
                            </router-link>
                        </h4>
                        <h5>
                            {{que.summary}}
                        </h5>
                    </el-card>
                </el-timeline-item>
            </el-timeline>
            <el-pagination class="mpage"
                           background
                           layout="prev, pager, next"
                           :current-page="currentPage"
                           :page-size="pageSize"
                           :total="total"
                           @current-change=page>
            </el-pagination>
            <el-backtop target=".page-component__scroll .el-scrollbar__wrap"></el-backtop>
        </div>
    </div>
</template>



<script>
    import Header1 from "../components/Header1";
    import SideMenu from "./inc/SideMenu";

    export default {
        name: "Tknowledge.vue",
        components: {Header1,SideMenu},
        data() {
            return {
                navList:[
                    {name:'/findProject',navItem:'发现项目'},
                    {name:'/communityActivity',navItem:'社区动态'},
                    {name:'/publishProject',navItem:'发布项目'},
                    {name:'/personalCenter',navItem:'个人中心'},
                    {name:'/manageCenter',navItem:'管理员中心'},
                ],
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
                _this.$axios.get("/m-knowledge/list?currentPage=" + currentPage).then(res => {
                    _this.questions = res.data.data.records
                    _this.currentPage = res.data.data.current
                    _this.total = res.data.data.total
                    _this.pageSize = res.data.data.size
                })
            },
        },
        created() {
            const _this = this
            this.page(1)
            if(this.$store.getters.getUser.username) {
                this.user.username = this.$store.getters.getUser.username
                this.user.avatar = "https://tse1-mm.cn.bing.net/th/id/R-C.8bc4a0f7276a0a788c248b39e8aa6b72?rik=eXQPjk%2fTIyTWLA&riu=http%3a%2f%2fpic.gerenjianli.com%2fxiaohui2046%2fb19.jpg&ehk=ycyFB%2fS2QK4tmRVY8tH6ixq1L3VQk62ubJ0ZLaJBuDQ%3d&risl=&pid=ImgRaw&r=0"
                this.hasLogin = true
            }

        },
    }
</script>

<style scoped>

    .mpage {
        margin: 0 auto;
        text-align: center;
    }

</style>
