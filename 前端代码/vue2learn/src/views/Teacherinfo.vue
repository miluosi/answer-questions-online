<template>
    <div class="login_container">
        <div class="login_box">
            <Header1></Header1>
            <div>
                <el-card class="box-card" style="width: 1000px">
                    <div slot="header" class="clearfix">
                        <span>{{user.username}}个人信息中心</span>
                    </div>
                    <div>
                        <div style="display: flex;justify-content: center">
                            <el-upload
                                    action="/admin/userface"
                                    :headers="headers"
                                    :data="admin"
                                    :show-file-list="false"
                                    :on-success="onSuccess">
                                <img title="点击修改用户图像" :src="user.avatar"
                                     style="height: 100px;width: 100px;border-radius: 50px"
                                     alt="">
                            </el-upload>

                        </div>
                        <div>
                            用户名：
                            <el-tag>{{user.username}}</el-tag>
                        </div>
                        <div>
                            教师号：
                            <el-tag>{{user.teacherid}}</el-tag>
                        </div>
                        <div style="display: flex;justify-content: space-around;margin-top: 10px">
                            <el-button type="primary" @click="showUpdateAdminInfoView">修改信息</el-button>
                            <el-button type="danger" @click="showUpdatePasswordVie">修改密码</el-button>
                        </div>
                    </div>
                </el-card>
                <el-dialog
                        title="编辑用户信息"
                        :visible.sync="dialogVisible"
                        width="100%">
                    <div>
                        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px"
                                 class="demo-ruleForm">
                            <el-form-item label="修改教师号" prop="teacherid">
                                <el-input type="text" v-model="ruleForm.teacherid" autocomplete="off"></el-input>
                            </el-form-item>
                            <el-form-item label="修改用户名" prop="username">
                                <el-input type="text" v-model="ruleForm.username" autocomplete="off"></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                                <el-button @click="resetForm('ruleForm')">重置</el-button>
                            </el-form-item>
                        </el-form>
                    </div>
                    <span slot="footer" class="dialog-footer">
          </span>
                </el-dialog>
                <el-dialog
                        title="更新密码"
                        :visible.sync="passwordDialogVisible"
                        width="100%">
                    <el-form :model="ruleForm1" status-icon :rules="rules1" ref="ruleForm1" label-width="100px"
                             class="demo-ruleForm">
                        <el-form-item label="请输入旧密码" prop="oldPass">
                            <el-input type="password" v-model="ruleForm1.oldPass" autocomplete="off"></el-input>
                        </el-form-item>
                        <el-form-item label="请输入新密码" prop="pass">
                            <el-input type="password" v-model="ruleForm1.pass" autocomplete="off"></el-input>
                        </el-form-item>
                        <el-form-item label="确认新密码" prop="checkPass">
                            <el-input type="password" v-model="ruleForm1.checkPass" autocomplete="off"></el-input>
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="submitpassword('ruleForm1')">提交</el-button>
                            <el-button @click="resetForm('ruleForm1')">重置</el-button>
                        </el-form-item>
                    </el-form>
                </el-dialog>
            </div>
            <div style="width: auto;height: 300px" id="main">
            </div>
            <div style="width: auto;height: 300px" id="main1">
            </div>
            <div style="width: auto;height: 300px" id="main2">
            </div>
        </div>
    </div>
</template>

<script>
    import Header1 from "../components/Header1";
    export default {
        components:{Header1},
        name: "Teacherinfo",
        data() {
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    if (this.ruleForm1.checkPass !== '') {
                        this.$refs.ruleForm1.validateField('checkPass');
                    }
                    callback();
                }
            };
            var validatePass2 = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请再次输入密码'));
                } else if (value !== this.ruleForm1.pass) {
                    callback(new Error('两次输入密码不一致!'));
                } else {
                    callback();
                }
            };
            return {
                headers: {
                    Authorization: window.sessionStorage.getItem('tokenStr')
                },
                activities: [],
                value: new Date(),
                user: {
                    username: '请先登录',
                    avatar: "https://tse1-mm.cn.bing.net/th/id/R-C.0f279cf9646f3d4b4f715d5c016ca6f0?rik=k2IkQYKSqnRKXQ&riu=http%3a%2f%2fpic17.nipic.com%2f20111112%2f6313940_154735194120_2.jpg&ehk=AYmN3ZSBwG1Gvi6p7TjVMbpRBCEDcU3o8wIsa1m2OhM%3d&risl=&pid=ImgRaw&r=0"
                },
                admin: null,
                admin2: null,
                dialogVisible: false,
                passwordDialogVisible: false,
                ruleForm: {
                    teacherid: '',
                    username: '',
                    id:''
                },
                echartdata:{
                    date:[],
                    count:[],
                    time:[],
                    tr:[],
                },
                ruleForm1: {
                    pass: '',
                    checkPass: '',
                    oldPass: '',
                    studentid:''
                },
                rules: {
                    username: [
                        {required: true, message: '请输入用户名', trigger: 'blur'},
                        {min: 3, max: 12, message: '长度在 3 到 12 个字符', trigger: 'blur'}
                    ],
                    teacherid: [
                        {required: true, message: '请输入教师号', trigger: 'blur'},
                    ]
                },
                rules1: {
                    pass: [
                        {validator: validatePass, trigger: 'blur'}
                    ],
                    checkPass: [
                        {validator: validatePass2, trigger: 'blur'}
                    ],
                    oldPass: [
                        {validator: validatePass, trigger: 'blur'}
                    ]
                }
            }
        },
        name: "page",
        methods: {
            onSuccess() {
                if(this.$store.getters.getUser.username) {
                    this.user.username = this.$store.getters.getUser.username
                    this.user.avatar = "https://tse1-mm.cn.bing.net/th/id/R-C.8bc4a0f7276a0a788c248b39e8aa6b72?rik=eXQPjk%2fTIyTWLA&riu=http%3a%2f%2fpic.gerenjianli.com%2fxiaohui2046%2fb19.jpg&ehk=ycyFB%2fS2QK4tmRVY8tH6ixq1L3VQk62ubJ0ZLaJBuDQ%3d&risl=&pid=ImgRaw&r=0"
                    this.user.specialty = this.$store.getters.getUser.specialty
                    this.user.studentid = this.$store.getters.getUser.studentid
                    this.user.password = this.$store.getters.getUser.password
                    this.user.sex = this.$store.getters.getUser.sex
                    this.hasLogin = true
                }
            },
            echartsInit() {
                //柱形图
                //因为初始化echarts 的时候，需要指定的容器 id='main'
                this.$echarts.init(document.getElementById('main')).setOption({
                    title: {
                        text: '做题数量记录',
                    },
                    xAxis: {
                        type: 'category',
                        data: this.echartdata.date
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: this.echartdata.count,
                        type: 'bar',
                        title: '做题数量记录',
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(220, 220, 220, 0.8)'
                        }
                    }]
                })
                this.$echarts.init(document.getElementById('main1')).setOption({
                    title: {
                        text: '做题时间记录',
                    },
                    xAxis: {
                        type: 'category',
                        data: this.echartdata.date
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: this.echartdata.time,
                        type: 'bar',
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(220, 220, 220, 0.8)'
                        }
                    }]
                })
                this.$echarts.init(document.getElementById('main2')).setOption({
                    title: {
                        text: '做题准确率记录',
                    },
                    xAxis: {
                        type: 'category',
                        data: this.echartdata.date
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [{
                        data: this.echartdata.tr,
                        type: 'bar',
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(220, 220, 220, 0.8)'
                        }
                    }]
                })
            },
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {

                    if (valid) {
                        // 提交逻辑
                        const _this = this;
                        this.$axios.post('/m-teacher/update', this.ruleForm).then((res)=>{
                            if(res.data.data.id){
                                _this.$alert('修改成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.ruleForm.username = res.data.data.username
                                        this.ruleForm.teacherid = res.data.data.teacherid
                                        this.user.username = res.data.data.username
                                        this.user.teacherid = res.data.data.teacherid
                                        this.$store.getters.getUser.username = res.data.data.username
                                        this.$store.getters.getUser.teacherid = res.data.data.teacherid
                                    }
                                })
                                console.log(res.data.data);
                            }
                        })
                    } else {
                        console.log('errorsubmit！');
                        return false;
                    }
                });
            },
            submitpassword(formName) {
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$axios.post('/m-teacher/updatepassword', this.ruleForm1).then((res)=> {
                            console.log(this.ruleForm1)
                            console.log(this.user.studentid)
                            console.log(res.data.data)
                            if(res.data.data.id){
                                this.$alert('修改成功，请重新登录', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$router.push("/login")
                                    }
                                })
                                console.log(res.data.data);
                            } else {
                                this.$alert('原始密码错误', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.ruleForm1.oldPass=""
                                    }
                                })
                                return false;
                            }
                        })
                    }
                    else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
            showUpdatePasswordVie() {
                this.passwordDialogVisible = true;
            },
            updateAdminInfo() {
                this.putRequest('/userinfo', this.admin2).then(resp => {
                    if (resp) {
                        this.dialogVisible = false;
                        this.created();
                    }
                })
            },
            showUpdateAdminInfoView() {
                this.dialogVisible = true;
            }
        },
        created() {
            if(this.$store.getters.getUser.username) {
                this.user.username = this.$store.getters.getUser.username
                this.user.avatar = "https://tse1-mm.cn.bing.net/th/id/R-C.8bc4a0f7276a0a788c248b39e8aa6b72?rik=eXQPjk%2fTIyTWLA&riu=http%3a%2f%2fpic.gerenjianli.com%2fxiaohui2046%2fb19.jpg&ehk=ycyFB%2fS2QK4tmRVY8tH6ixq1L3VQk62ubJ0ZLaJBuDQ%3d&risl=&pid=ImgRaw&r=0"
                this.user.password = this.$store.getters.getUser.password
                this.user.teacherid = this.$store.getters.getUser.teacherid
                this.ruleForm.id = this.$store.getters.getUser.id
                this.ruleForm.username = this.$store.getters.getUser.username
                this.ruleForm.teacherid = this.$store.getters.getUser.teacherid
                this.ruleForm1.studentid = this.$store.getters.getUser.id
                this.hasLogin = true
                console.log(this.user.teacherid)
                this.$axios.get('/qsinfo').then((res)=> {
                    console.log(res.data.data.content)
                    var arr = res.data.data.content
                    console.log(arr)
                    console.log(this.user.userlevel)
                    for (let i=0; i<arr.length; i++) {
                        if(this.user.userlevel>arr[i].qslevel)
                        {
                            this.activities.push({
                                content: arr[i].type,
                                color: '#0bbd87',
                            })
                        }else if (this.user.userlevel==arr[i].qslevel) {
                            this.activities.push({
                                content: arr[i].type,
                                icon: 'el-icon-more',
                                size: 'large',
                                type: 'primary',
                            })
                        }else {
                            this.activities.push({
                                content: arr[i].type
                            })
                        }
                    }
                })
            }
        }
    }
</script>

<style lang="less" scoped>
    // 跟节点样式
    .login_container {
        height: 100%;
    }
    // 登录框
    .login_box {
        width: 1000px;
        height: 840px;
        background-color: #fff;
        border-radius: 3px;// 圆角
        position: absolute;// 绝对定位
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        // 头像框
        .btns {
            display: flex;// 弹性布局
            justify-content: flex-end; // 尾部对齐
        }
    }
    @media screen and (max-width: 500px) {
        .login_box {
            width: 100%;
        }
        .login_form {
            width: 80% !important;
            margin-left: 12% !important;
        }
        .avatar_box {
            width: 90px !important;
            height: 90px !important;
            margin-top: 50px !important;
        }
    }
</style>

