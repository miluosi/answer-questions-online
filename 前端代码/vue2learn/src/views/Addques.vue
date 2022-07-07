<template>
    <div>
        <Header1></Header1>
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="150px"
                 class="demo-ruleForm">
            <el-form-item label="问题类型" prop="type">
                <el-input type="text" v-model="ruleForm.type" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="问题级别" prop="qslevel">
                <el-input type="text" v-model="ruleForm.qslevel" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="问题内容" prop="content">
                <el-input type="text" v-model="ruleForm.content" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="标准答案" prop="trueanswer">
                <el-input type="text" v-model="ruleForm.trueanswer" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="问题考点" prop="point">
                <el-input type="text" v-model="ruleForm.point" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
                <el-button @click="resetForm('ruleForm')">重置</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
    import Header1 from "../components/Header1";
    export default {
        name: "AddKnowledge",
        components:{Header1},
        data() {
            return {
                ruleForm: {
                    type: '',
                    trueanswer:'',
                    point: '',
                    qslevel:'',
                    content:'',
                },
                rules: {
                    type: [
                        {required: true, message: '请输入问题类型', trigger: 'blur'},
                    ],
                    trueanswer: [
                        {required: true, message: '请输入正确答案', trigger: 'blur'},
                    ],
                    content: [
                        {required: true, message: '请输入问题内容', trigger: 'blur'},
                    ],
                    qslevel: [
                        {required: true, message: '请输入问题级别', trigger: 'blur'},
                    ],
                },
            }
        },
        methods:{
            submitForm(formName) {
                this.$refs[formName].validate((valid) => {

                    if (valid) {
                        // 提交逻辑
                        const _this = this;
                        this.$axios.post('/m-question/addquestion', this.ruleForm).then((res)=>{
                            if(res.data.data.msg=="success"){
                                _this.$alert('添加问题成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$router.push("/teacher")
                                    }
                                })
                            }
                        })
                    } else {
                        console.log('errorsubmit！');
                        return false;
                    }
                });
            },
            resetForm(formName) {
                this.$refs[formName].resetFields();
            },
        }
    }
</script>

<style scoped>

</style>
