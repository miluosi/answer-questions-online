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
            <el-collapse v-model="activeNames" @change="handleChange">
                <el-collapse-item title="相关知识点" name="1">
                    <ul>
                        <li v-for="tab in tips">
                            {{ tab }}
                        </li>
                    </ul>
                </el-collapse-item>
            </el-collapse>
            <el-collapse v-model="activeNames" @change="handleChange1">
                <el-collapse-item title="老师评价" name="1">
                    <ul>
                        <li>{{this.review}}</li>
                    </ul>
                </el-collapse-item>
            </el-collapse>
        </div>

        <div class="m-content">
            <div>原始作答：</div>
            <div class="markdown-body" v-html="blog.myanswer"></div>
            <div>消耗时间：单位（秒）</div>
            <div class="markdown-body" v-html="blog.time"></div>
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="重新作答" prop="answer" >
                    <mavon-editor v-model="ruleForm.answer"></mavon-editor>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')">提交答案</el-button>
                    <el-button  @click="shoucang">收藏问题</el-button>
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
        name: "Questioncheck",
        components: {Header},
        data() {
            return {
                activeNames: ['1'],
                tips:[],
                review:"",
                ruleForm: {
                    userid: '',
                    qsid: '',
                    answer: '',
                    created_time:"",
                    finished_time:" ",
                },
                isShow :false,
                blog: {
                    id: "",
                    title: "",
                    content: "",
                    answer:"",
                    mysanswer:"",
                    time:"",
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
            handleChange(val) {
                console.log(val);
            },
            handleChange1(val) {
                console.log(val);
            },
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
                });
            },
            checkanswer(){
                const _this = this;
                _this.$confirm("是否确认查看答案", "提示", {
                    iconClass: "el-icon-question",//自定义图标样式
                    confirmButtonText: "确认",//确认按钮文字更换
                    cancelButtonText: "取消",//取消按钮文字更换
                    showClose: true,//是否显示右上角关闭按钮
                    type: "warning",//提示类型  success/info/warning/error
                }).then(function () {
                    _this.isShow = false;
                }).then((data) => {
                    _this.isShow = true;
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
            shoucang(){
              console.log(this.ruleForm.userid);
              console.log(this.ruleForm.qsid);
                this.$axios.get('/m-question/addshoucang/' + this.ruleForm.userid+"/"+this.ruleForm.qsid).then(res => {
                    if(res.data.data.msg=="fail"){
                        this.$alert('已经添加过该问题请勿重复添加', '提示', {
                            confirmButtonText: '确定',
                        })
                    }else {
                        this.$alert('成功添加该问题！', '提示', {
                            confirmButtonText: '确定',
                        })
                    }
                })
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
            const blogId = this.$route.params.id
            const userId = this.$route.params.userid
            console.log(blogId)
            const _this = this
            this.$axios.get('/m-question/check/' + userId+"/"+blogId).then(res => {
                const blog = res.data.data[0]
                console.log(blog[0])
                _this.ruleForm.qsid = blog.qsid
                _this.blog.title = blog.title
                _this.blog.content = blog.content
                _this.blog.myanswer = blog.answer
                _this.blog.time = blog.whole_time
                _this.blog.answer = blog.trueanswer
                var MardownIt = require("markdown-it")
                var md = new MardownIt()
                var result = md.render(blog.content)
                _this.blog.content = result
                console.log("问题")
                console.log(_this.ruleForm.qsid)
                _this.$axios.get("/m-knowledge/gettips?qsid="+ blog.qsid).then(res => {
                    var arr = res.data.data.content
                    for(let i =0;i<arr.length;i++)
                    {
                        _this.tips.push(arr[i].content)
                    }
                    console.log(_this.tips)
                })
                _this.$axios.get("/m-knowledge/getreview/"+ userId+"/"+this.$route.params.id).then(res => {
                    console.log("hello")
                    console.log(res)
                    if(res.data.data.content[0])
                    {
                        if(res.data.data.content[0].review)
                        {
                            _this.review = res.data.data.content[0].review
                            console.log(_this.review)
                        }else {
                            _this.review = "老师暂无评价"
                        }
                    }else {
                        _this.review = "老师暂无评价"
                    }
                })
            })
            if(this.$store.getters.getUser.username) {
                _this.ruleForm.userid = this.$store.getters.getUser.studentid
            }
        }
    }
</script>

<style scoped>
    .m-content {
        text-align: center;
    }
</style>
