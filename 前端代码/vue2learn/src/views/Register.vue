<template>
      <div>
        <el-container>
          <el-header>
            <router-link to="/blogs">
            <img src="https://tse1-mm.cn.bing.net/th/id/R-C.0f279cf9646f3d4b4f715d5c016ca6f0?rik=k2IkQYKSqnRKXQ&riu=http%3a%2f%2fpic17.nipic.com%2f20111112%2f6313940_154735194120_2.jpg&ehk=AYmN3ZSBwG1Gvi6p7TjVMbpRBCEDcU3o8wIsa1m2OhM%3d&risl=&pid=ImgRaw&r=0"
                              style="height: 100%; margin-top: 10px;">
            </router-link>
          </el-header>
          <el-main>
            <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px"
                                      class="demo-ruleForm">
              <el-form-item label="学号" prop="studentid">
                <el-input type="text" maxlength="12" v-model="ruleForm.studentid"></el-input>
              </el-form-item>
              <el-form-item label="密码" prop="password">
                <el-input type="text" v-model="ruleForm.password" autocomplete="off"></el-input>
              </el-form-item>
                <el-form-item label="用户名" prop="username">
                    <el-input type="text" v-model="ruleForm.username" autocomplete="off"></el-input>
                  </el-form-item>
                 <el-form-item label="性别" prop="sex">
                    <el-input type="text" v-model="ruleForm.sex" autocomplete="off"></el-input>
                  </el-form-item>
                <el-form-item label="专业" prop="specialty">
                    <el-input type="text" v-model="ruleForm.specialty" autocomplete="off"></el-input>
                  </el-form-item>
              <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">注册</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
              </el-form-item>
            </el-form>
          </el-main>
        </el-container>
      </div>
</template>
<script>
    export default {
        name: 'Login',
        data() {
            var validatePass = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入密码'));
                } else {
                    callback();
                }
            };
            return {
                ruleForm: {
                    password: '',
                    studentid: '',
                    username:'',
                    sex:'',
                    specialty:''
                },
                rules: {
                    password: [
                        {validator: validatePass, trigger: 'blur'},
                        {min: 6, max: 8, message: '长度在 6 到 8 个字符', trigger: 'blur'}
                    ],
                    username: [
                        {required: true, message: '请输入用户名', trigger: 'blur'},
                        {min: 3, max: 12, message: '长度在 3 到 12 个字符', trigger: 'blur'}
                    ],
                    studentid: [
                        {required: true, message: '请输入学号', trigger: 'blur'},
                        {min: 7, max: 7, message: '输入长度为7的字符', trigger: 'blur'}
                     ],
                    sex: [
                        {required: true, message: '请输入性别', trigger: 'blur'},
                    ],
                    specialty: [
                        {required: true, message: '请输入专业', trigger: 'blur'},
                    ],
                }
            };
        },
        methods: {
            submitForm(formName) {
                const _this = this
                this.$refs[formName].validate((valid) => {
                    if (valid) {
                        // 提交逻辑
                        this.$axios.post('/register', this.ruleForm).then((res)=>{
                            console.log(res.data.data)
                            if(res.data.data.resultcode==400){
                                _this.$alert('用户名重复', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.ruleForm.username = ""
                                    }
                            })}
                            if(res.data.data.resultcode==500){
                                _this.$alert('该学号已注册账号', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.ruleForm.studentid = ""
                                    }
                                })}
                            if(res.data.data.id){
                                _this.$alert('注册成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        _this.$router.push("/login")
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
            }
        },
        mounted() {
            this.$notify({
                title: '看这里：',
                message: '注册学生系统',
                duration: 1500
            });
        }
    }
</script>
