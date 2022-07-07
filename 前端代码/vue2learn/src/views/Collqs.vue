<template>
    <div class="mcontaner">
        <Header></Header>
        <div>
            {{user.username}}您一共收藏了{{this.total}}道题目
        </div>
        <div>
            其中您收藏最多的是{{this.questioninfo[0].type}}类型的题目
        </div>
        <div>
            一共收藏了{{this.questioninfo[0].count}}道题目
        </div>
        <div class="block">
            <el-timeline>
                <el-timeline-item :timestamp="que.created_time" placement="top" v-for="que in questions">
                    <el-card>
                        <h4>
                            <router-link :to="{name: 'Questionsolve', params: {questionId:que.qsid}}">
                                {{que.content}}
                            </router-link>
                        </h4>
                        <h5>
                            {{que.type}}
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
        </div>
    </div>
</template>

<script>
    import Header from "../components/Header";
    import SideMenu from "./inc/SideMenu";

    export default {
        name: "Collqs.vue",
        components: {Header,SideMenu},
        data() {
            return {
                questions: {},
                questioninfo:{},
                currentPage: 1,
                total: 0,
                pageSize: 5,
                user: {
                    username: '请先登录',
                    avatar: "https://tse1-mm.cn.bing.net/th/id/R-C.0f279cf9646f3d4b4f715d5c016ca6f0?rik=k2IkQYKSqnRKXQ&riu=http%3a%2f%2fpic17.nipic.com%2f20111112%2f6313940_154735194120_2.jpg&ehk=AYmN3ZSBwG1Gvi6p7TjVMbpRBCEDcU3o8wIsa1m2OhM%3d&risl=&pid=ImgRaw&r=0"
                },
            }
        },
        methods: {
            page(currentPage) {
                const _this = this
                _this.$axios.get("/m-question/shoucangqs/" + this.$route.params.userId+"?currentPage="+ currentPage).then(res => {
                    console.log(res.data.data)
                    _this.questions = res.data.data.content
                    console.log(_this.questions)
                    _this.questioninfo = res.data.data.content2
                    _this.currentPage =1
                    _this.total = res.data.data.total
                    _this.pageSize = res.data.data.size
                    console.log(_this.total)
                    console.log(_this.pageSize)
                    console.log(_this.questioninfo[0].type)
                })
            }
        },
        created() {
            const userId = this.$route.params.userId
            console.log(userId)
            this.page(1)
            if(this.$store.getters.getUser.username) {
                this.user.username = this.$store.getters.getUser.username
                this.user.avatar = "https://tse1-mm.cn.bing.net/th/id/R-C.8bc4a0f7276a0a788c248b39e8aa6b72?rik=eXQPjk%2fTIyTWLA&riu=http%3a%2f%2fpic.gerenjianli.com%2fxiaohui2046%2fb19.jpg&ehk=ycyFB%2fS2QK4tmRVY8tH6ixq1L3VQk62ubJ0ZLaJBuDQ%3d&risl=&pid=ImgRaw&r=0"
                this.user.specialty = this.$store.getters.getUser.specialty
                this.user.studentid = this.$store.getters.getUser.studentid
                this.hasLogin = true
            }
        }
    }
</script>

<style scoped>

    .mpage {
        margin: 0 auto;
        text-align: center;
    }

</style>
