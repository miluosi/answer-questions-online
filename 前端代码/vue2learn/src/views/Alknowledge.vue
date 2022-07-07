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
            <div>关键字：</div>
            <div class="markdown-body" v-html="blog.summary"></div>
            <el-divider></el-divider>
            <div>类别：</div>
            <div class="markdown-body" v-html="blog.type"></div>
        </div>

        <div class="m-content">

            <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
                <el-form-item label="知识点" prop="content" >
                    <mavon-editor v-model="ruleForm.content"></mavon-editor>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="submitForm('ruleForm')">更新知识点</el-button>
                    <el-button type="primary" @click="dele">删除知识点</el-button>
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
        name: "Questionsolve",
        components: {Header1},
        data() {
            return {
                ruleForm: {
                    knid: '',
                    content: '',
                },
                qsnum:{
                    userid:'',
                    qsid:''
                },
                isShow :false,
                blog: {
                    id: "",
                    summary: "",
                    content: "",
                    type:""
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
                        console.log(_this.ruleForm.knid)
                        console.log(_this.ruleForm.content)
                        this.$axios.post('/m-knowledge/alter', this.ruleForm).then((res)=>{
                            console.log(res.data.data.id);
                            if(res.data.data.id!="")
                            {
                                _this.$alert('知识点修正成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/teacher")
                                    }
                                })
                            }else {
                                _this.$alert('知识点修正失败', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/teacher")
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
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            dele(){
                this.$axios.post('/m-knowledge/dele', this.ruleForm.knid).then((res)=>{
                    if(res.data.data.msg=="success")
                    {
                        this.$alert('知识点删除成功', '提示', {
                            confirmButtonText: '确定',
                            callback: action => {
                                this.$router.push("/tknowledge")
                            }
                        })
                    }
                })
            }
        },
        created() {
            const blogId = this.$route.params.knowledgeId
            const _this = this
            this.$axios.get('/m-knowledge/getone/' + blogId).then(res => {
                const blog = res.data.data
                console.log(blog)
                _this.blog.summary = blog[0].summary
                _this.blog.content = blog[0].content
                _this.blog.type = blog[0].type
                this.ruleForm.content = blog[0].content
                this.ruleForm.knid = blog[0].id
            })
        }
    }
</script>

<style scoped>
    .m-content {
        text-align: center;
    }
</style>
