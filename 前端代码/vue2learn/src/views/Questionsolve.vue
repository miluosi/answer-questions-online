<template>
    <div>
        <Header></Header>
        <div class="mblog">
        <!--    <h2> {{ blog.content }}</h2>
            <h2> {{ blog.answer }}</h2>-->
            <el-link icon="el-icon-edit" v-if="ownBlog">
                <router-link :to="{name: 'BlogEdit', params: {blogId: blog.id}}" >
                    编辑
                </router-link>
            </el-link>
            <el-divider></el-divider>
            <div>问题：</div>
            <div class="markdown-body" v-html="blog.content"></div>
        </div>

        <div class="m-content">

            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="我的答案" prop="answer" >
                    <mavon-editor v-model="ruleForm.answer"></mavon-editor>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')">提交答案</el-button>
                    <el-button @click="checkanswer">查看标准答案</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
            </el-form>
            <div class="markdown-body"  v-show="isShow" v-html="blog.answer" ></div>
        </div>
    </div>
</template>

<script>
    import Header from "../components/Header";
    export default {
        name: "Questionsolve",
        components: {Header},
        data() {
            return {
                ruleForm: {
                    userid: '',
                    qsid: '',
                    answer: '',
                    created_time:"",
                    finished_time:" ",
                },
                qsnum:{
                    userid:'',
                    qsid:''
                },
                isShow :false,
                blog: {
                    id: "",
                    title: "",
                    content: "",
                    answer:""
                },
                rules: {
                    answer: [
                        { required: true, message: '请输入答案', trigger: 'blur' }
                    ]
                }
            };
        },
        mounted() {
            this.currentTime();
        },
        methods: {
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        const _this = this
                        let date = new Date();
                        let year = date.getFullYear(); // 年
                        let month = date.getMonth() + 1; // 月
                        let day = date.getDate(); // 日
                        let hour = date.getHours(); // 时
                        hour = hour < 10 ? "0" + hour : hour; // 如果只有一位，则前面补零
                        let minute = date.getMinutes(); // 分
                        minute = minute < 10 ? "0" + minute : minute; // 如果只有一位，则前面补零
                        let second = date.getSeconds(); // 秒
                        second = second < 10 ? "0" + second : second; // 如果只有一位，则前面补零
                        this.ruleForm.finished_time = `${year}-${month}-${day} ${hour}:${minute}:${second}`;
                        console.log(_this.ruleForm.userid)
                        console.log(_this.ruleForm.qsid)
                        console.log("in:",_this.ruleForm.created_time)
                        console.log("out:",_this.ruleForm.finished_time)
                        console.log(_this.ruleForm.answer)
                        this.$axios.post('/m-question/add', this.ruleForm).then((res)=>{
                            console.log(res.data.data.id);
                            if(res.data.data.id!="")
                            {
                                _this.$alert('答案提交成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/question")
                                    }
                                })
                            }else {
                                _this.$alert('答案提交失败', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/question")
                                    }
                                })
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                        this.$axios.post('/qsnum/addqsnum', this.qsnum).then((res)=> {
                            if(res.data.data.msg){
                                console.log("success")
                            }else {
                                console.log("fail")
                            }
                        })
                });
            },
            checkanswer() {
                const _this = this;
                _this.$alert('做题阶段不能查看答案', '提示', {
                    confirmButtonText: '确定',
                    callback: action => {
                        this.isShow = false;
                    }
                })
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            currentTime() {
                setInterval(this.formatDate, 500);
            },
            currentTime2() {
                setInterval(this.formatDate2, 500);
            },
            formatDate() {
                if(this.ruleForm.created_time=="")
                {
                    let date = new Date();
                    let year = date.getFullYear(); // 年
                    let month = date.getMonth() + 1; // 月
                    let day = date.getDate(); // 日
                    let week = date.getDay(); // 星期
                    let weekArr = [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ];
                    let hour = date.getHours(); // 时
                    hour = hour < 10 ? "0" + hour : hour; // 如果只有一位，则前面补零
                    let minute = date.getMinutes(); // 分
                    minute = minute < 10 ? "0" + minute : minute; // 如果只有一位，则前面补零
                    let second = date.getSeconds(); // 秒
                    second = second < 10 ? "0" + second : second; // 如果只有一位，则前面补零
                    this.ruleForm.created_time = `${year}-${month}-${day} ${hour}:${minute}:${second}`;
                }else {
                    this.ruleForm.created_time =  this.ruleForm.created_time;
                }
            },
            formatDate2() {
                let date = new Date();
                let year = date.getFullYear(); // 年
                let month = date.getMonth() + 1; // 月
                let day = date.getDate(); // 日
                let week = date.getDay(); // 星期
                let weekArr = [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ];
                let hour = date.getHours(); // 时
                hour = hour < 10 ? "0" + hour : hour; // 如果只有一位，则前面补零
                let minute = date.getMinutes(); // 分
                minute = minute < 10 ? "0" + minute : minute; // 如果只有一位，则前面补零
                let second = date.getSeconds(); // 秒
                second = second < 10 ? "0" + second : second; // 如果只有一位，则前面补零
                this.ruleForm.finished_time = `${year}-${month}-${day} ${hour}:${minute}:${second}`;
            }
        },
        created() {
            const blogId = this.$route.params.questionId
            console.log(blogId)
            const _this = this
            this.$axios.get('/m-question/' + blogId).then(res => {
                const blog = res.data.data
                _this.ruleForm.qsid = blog.id
                _this.blog.title = blog.title
                _this.blog.content = blog.content
                _this.blog.answer = blog.trueanswer
                _this.qsnum.qsid = blogId
                var MardownIt = require("markdown-it")
                var md = new MardownIt()
                var result = md.render(blog.content)
                _this.blog.content = result
            })
            if(this.$store.getters.getUser.username) {
                _this.ruleForm.userid = this.$store.getters.getUser.studentid
                _this.qsnum.userid = this.$store.getters.getUser.studentid
            }
        }
    }
</script>

<style scoped>
    .m-content {
        text-align: center;
    }
</style>
