<template>
  <div class="m-content">
    <h3>欢迎来到同济大学学生java学习系统</h3>
    <div class="block">
      <el-avatar :size="50" :src="user.avatar"></el-avatar>
      <div>专业：{{user.specialty}}</div>
      <div>用户名：{{ user.username }}</div>
      <div>学号：{{ user.studentid }}</div>
        <div>学习进度：{{this.process}}</div>
    </div>
    <div class="maction">
      <span><router-link :to="{name: 'Questions'}">
                 主页
                </router-link></span>
      <el-divider direction="vertical"></el-divider>
      <span> <router-link :to="{name: 'Questionfinished', params: {userId: user.studentid}}">
                 查看已做
                </router-link></span>
        <el-divider direction="vertical"></el-divider>
        <span> <router-link :to="{name: 'Collqs', params: {userId: user.studentid}}">
                 查看收藏
                </router-link></span>
        <el-divider direction="vertical"></el-divider>
        <span> <router-link :to="{name: 'Wrongqs', params: {userId: user.studentid}}">
                 错题总结
                </router-link></span>
        <el-divider direction="vertical"></el-divider>
        <span> <router-link :to="{name: 'Reco'}">
                 推荐练习
                </router-link></span>
        <el-divider direction="vertical"></el-divider>
        <span> <router-link :to="{name: 'Userinfo'}">
                 个人信息中心
                </router-link></span>
        <el-divider direction="vertical"></el-divider>
        <span> <router-link :to="{name: 'Knowledge'}">
                 知识点查看
                </router-link></span>
      <el-divider direction="vertical"></el-divider>
      <span v-show="!hasLogin"><el-link type="primary" href="/#/login">用户登录</el-link></span>
      <span v-show="hasLogin"><router-link to="/login" type="danger" >退出</router-link></span>
    </div>

  </div>
</template>

<script>
  export default {
    name: "Header",
    data() {
      return {
          level:"",
          process:"",
        user: {
          username: '请先登录',
          avatar: "https://tse1-mm.cn.bing.net/th/id/R-C.0f279cf9646f3d4b4f715d5c016ca6f0?rik=k2IkQYKSqnRKXQ&riu=http%3a%2f%2fpic17.nipic.com%2f20111112%2f6313940_154735194120_2.jpg&ehk=AYmN3ZSBwG1Gvi6p7TjVMbpRBCEDcU3o8wIsa1m2OhM%3d&risl=&pid=ImgRaw&r=0"
        },
        hasLogin: false,
      }
    },
    methods: {
      logout() {
        const _this = this
        _this.$axios.get("/#/logout", {
          headers: {
            "Authorization": localStorage.getItem("token")
          }
        }).then(res => {
          _this.$store.commit("REMOVE_INFO")
          _this.$router.push("/login")

        })
      }
    },
    created() {
      if(this.$store.getters.getUser.username) {
        this.user.username = this.$store.getters.getUser.username
        this.user.avatar = "https://tse1-mm.cn.bing.net/th/id/R-C.8bc4a0f7276a0a788c248b39e8aa6b72?rik=eXQPjk%2fTIyTWLA&riu=http%3a%2f%2fpic.gerenjianli.com%2fxiaohui2046%2fb19.jpg&ehk=ycyFB%2fS2QK4tmRVY8tH6ixq1L3VQk62ubJ0ZLaJBuDQ%3d&risl=&pid=ImgRaw&r=0"
        this.user.specialty = this.$store.getters.getUser.specialty
        this.user.studentid = this.$store.getters.getUser.studentid
          this.user.userlevel = this.$store.getters.getUser.userlevel
        this.hasLogin = true
      }
        this.$axios.get("/getupdateinfo?studentid=" + this.user.studentid).then(res => {
            console.log("查询")
            this.user.userlevel = res.data.data.page
            this.level =  res.data.data.page
            if(this.level==0){
                this.process = "Java语言语法基础"
            }else if(this.level==1){
                this.process = "Java面向对象"
            }else if(this.level==2){
                this.process = "Java异常处理"
            }else {
                this.process = "Java异常处理1"
            }
            console.log(this.user.userlevel)
        })
        console.log(this.user.userlevel)
    }
  }
</script>

<style scoped>

  .m-content {
    max-width: 960px;
    margin: 0 auto;
    text-align: center;
  }
  .maction {
    margin: 10px 0;
  }

</style>
