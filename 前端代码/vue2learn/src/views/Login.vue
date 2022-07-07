<template>
    <div class="login_container">
        <div class="login_box">
            <div class="avatar_box">
                <!--头像-->
                <img src="../assets/同济大学.jpg" alt />
            </div>
            <div>

            </div>
            <el-form ref="ruleForm" :model="ruleForm" :rules="loginRules" class="login_form" label-width="100px">
                <el-form-item   label="学号/教师号" prop="studentid">
                    <el-input   v-model="ruleForm.studentid" class="login-madia" prefix-icon="iconfont icon-user"/>
                </el-form-item>
                <el-form-item  label="密码" prop="password">
                    <el-input   v-model="ruleForm.password" class="login-madia" prefix-icon="iconfont icon-zi" type="password"/>
                </el-form-item>
                <el-form-item label="身份选择" prop="identity">
                    <el-radio v-model="radio1" label="1">学生</el-radio>
                    <el-radio v-model="radio1" label="2">教师</el-radio>
                </el-form-item>
           <!--     <el-form-item label="验证码" prop="code">
                    <el-input   v-model="ruleForm.code" class="login-madia" prefix-icon="iconfont icon-zi" type="password"/>
                </el-form-item>
                <img :src="captchaUrl" @click="updateCaptcha">-->
                <el-form-item class="btns">
                    <el-button type="primary" @click="submitForm('ruleForm')">登录</el-button>
                    <el-button type="primary" @click=" toregis">注册</el-button>
                    <el-button type="info" @click="resetLoginForm">重置</el-button>
                </el-form-item>
            </el-form>
        </div>
    </div>
</template>

<script>
export default {
    name: 'Login',
    data() {
        return {
            captchaUrl: 'http://localhost:8081/captcha',
            checkedValue:'',
            list:[{value:"学生"},{value:"教师"}],
            ruleForm: {
                studentid: '',
                password: '',
                code:'',
                identity:''
            },
            radio1: '1',
            loginRules: {
                studentid: [
                    { required: true, message: "请输入学号", trigger: "blur" },
                    { min: 2, max: 8, message: "长度在 2 到 8 个字符", trigger: "blur" }
                ],
                password: [
                    { required: true, message: "请输入密码", trigger: "blur" },
                    { min: 6, max: 8, message: "密码为 6~8 位", trigger: "blur" }
                ],
                code: [{required: true, message: '请输入验证码', trigger: 'blur'}]
            }
        }
    },
    methods: {
        //重置表单
        resetLoginForm() {
            //充值数据，并清空校验警告
            this.$refs.ruleForm.resetFields();
        },
        resetLoginForm2() {
            console.log(this.radio1)
        },
        updateCaptcha() {
            this.captchaUrl = '/captcha';
        },
        submitForm(formName) {
            if(this.radio1==1)
            {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        // 提交逻辑

                        this.$axios.post('/login', this.ruleForm).then((res)=>{
                            const token = res.headers['authorization']
                            _this.$store.commit('SET_TOKEN', token)
                            _this.$store.commit('SET_USERINFO', res.data.data)
                            console.log(res.data.data.msg)
                            if(res.data.data.id){
                                _this.$alert('登录成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/question")
                                    }
                                })
                            }
                    if(res.data.data.msg=="empty"){
                        _this.$alert('用户名不存在', '提示', {
                            confirmButtonText: '确定',
                            callback: action => {
                                this.$refs.ruleForm.resetFields();
                            }
                        })
                    }
                            if(res.data.data.msg=="wrong"){
                                _this.$alert('密码错误', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.ruleForm.password = ""
                                    }
                                })
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            }else {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        this.$axios.post('/m-teacher/login', this.ruleForm).then((res)=>{
                            if(res.data.data.id){
                                const token = res.headers['authorization']
                                _this.$store.commit('SET_TOKEN', token)
                                _this.$store.commit('SET_USERINFO', res.data.data)
                                console.log(res.data.data.id)
                                _this.$alert('登录成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/teacher")
                                    }
                                })
                            }
                            if(res.data.data.msg=="empty"){
                                _this.$alert('教师名不存在', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$refs.ruleForm.resetFields();
                                    }
                                })
                            }
                            if(res.data.data.msg=="wrong"){
                                _this.$alert('密码错误', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.ruleForm.password = ""
                                    }
                                })
                            }
                        })
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            }

        },
        toregis(){
            const _this = this;
            _this.$router.push("/register");
        },
    },
    mounted() {
        this.$notify({
            title: '看这里：',
            message: '登录Java学习系统',
            duration: 1500
        });
    }
}
</script>

<!-- 加上 "scoped" 该样式只在当前组件有效 -->
<style lang="less" scoped>
    // 跟节点样式
    .login_container {
        height: 100%;
    }
    // 登录框
    .login_box {
        width: 600px;
        height: 400px;
        background-color: #fff;
        border-radius: 3px;// 圆角
        position: absolute;// 绝对定位
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        border: 1px solid #eaeaea;
        box-shadow: 0 0 25px #cac6c6;// 根据自己位置 以自己为长度位移
        // 头像框
        .avatar_box {
            width: 130px;
            height: 130px;
            box-shadow: 0 0 2px #ddd;// 盒子阴影
            position: absolute;
            left: 50%;
            transform: translate(-50%, -50%);
            img {
                width: 100%;
                height: 100%;
                background-color: white;
            }
        }
        .btns {
            display: flex;// 弹性布局
            justify-content: flex-end; // 尾部对齐
        }
        .login_form {
            position: absolute;
            bottom: 0%;
            width: 100%;
            padding: 0 10px;
            box-sizing: border-box;// 设置边框
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
