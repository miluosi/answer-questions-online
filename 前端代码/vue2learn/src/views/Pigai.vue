<template>
    <div>
        <Header1></Header1>
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
            <div class="markdown-body" v-html="this.qsinfo.content"></div>
            <div>标准答案：</div>
            <div class="markdown-body" v-html="this.qsinfo.trueanswer"></div>
            <div>学生答案：</div>
            <div class="markdown-body" v-html="blog.content"></div>
        </div>
        <div class="m-content">
            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="教师点评" prop="review" >
                    <mavon-editor v-model="ruleForm.review"></mavon-editor>
                </el-form-item>
                <el-form-item label="正误判别" prop="identity">
                    <el-radio v-model="ruleForm.ifTrue" label="1">正确</el-radio>
                    <el-radio v-model="ruleForm.ifTrue" label="2">错误</el-radio>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')">提交判别</el-button>
                    <el-button @click="resetForm('ruleForm')">重置</el-button>
                </el-form-item>
            </el-form>
            <div class="markdown-body"  v-show="isShow" v-html="blog.answer" ></div>
        </div>
    </div>
</template>

<script>
    import Header1 from "../components/Header1";
    export default {
        name: "Questioncheck",
        components: {Header1},
        data() {
            return {
                activeNames: ['1'],
                tips:[],
                ruleForm: {
                    id: '',
                    userid:'',
                    review: '',
                    ifTrue:'1',
                },
                qsinfo:{
                  content:'',
                  trueanswer:'',
                },
                isShow :false,
                blog: {
                    id: "",
                    title: "",
                    content: "",
                    answer:"",
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
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$axios.post('/m-teacher/add', this.ruleForm).then((res)=>{
                            if(res.data.data.id!="")
                            {
                                this.$alert('批改提交成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$router.push("/teacher")
                                    }
                                })
                            }else {
                                this.$alert('答案提交失败', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$router.push("/teacher")
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
            showinfo(){
                console.log(this.ruleForm)
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
            }
        },
        created() {
            const blogId = this.$route.params.id
            const userId = this.$route.params.userid
            const blogId2 = this.$route.params.qsid
            console.log(blogId)
            const _this = this
            this.$axios.get('/m-teacher/check/' + userId+"/"+blogId).then(res => {
                const blog = res.data.data[0]
                console.log(blog)
                _this.ruleForm.id = blogId
                _this.ruleForm.userid = userId
                _this.blog.content = blog.content
                _this.blog.myanswer = blog.answer
                var MardownIt = require("markdown-it")
                var md = new MardownIt()
                var result = md.render(blog.content)
                _this.blog.content = result
                console.log("问题")
                console.log(_this.ruleForm.qsid)
            })
            this.$axios.get('/m-teacher/qsinfo/'+"/"+blogId2).then(res => {
                const blog = res.data.data[0]
                console.log(blog)
                _this.qsinfo.content = blog.content
                _this.qsinfo.trueanswer = blog.trueanswer
            })
        }
    }
</script>

<style scoped>
    .m-content {
        text-align: center;
    }
</style>
