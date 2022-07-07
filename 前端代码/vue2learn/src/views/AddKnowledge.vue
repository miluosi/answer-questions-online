<template>
    <div>
        <Header1></Header1>
        <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="150px"
                 class="demo-ruleForm">
            <el-form-item label="知识点类型" prop="type">
                <el-input type="text" v-model="ruleForm.type" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="知识点关键字" prop="summary">
                <el-input type="text" v-model="ruleForm.summary" autocomplete="off"></el-input>
            </el-form-item>
            <el-form-item label="知识点内容" prop="content">
                <el-input type="text" v-model="ruleForm.content" autocomplete="off"></el-input>
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
                    summary: '',
                    content:''
                },
                rules: {
                    type: [
                        {required: true, message: '请输入知识点类型', trigger: 'blur'},
                    ],
                    summary: [
                        {required: true, message: '请输入知识点概述', trigger: 'blur'},
                    ],
                    content: [
                        {required: true, message: '请输入知识点内容', trigger: 'blur'},
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
                        this.$axios.post('/m-knowledge/add', this.ruleForm).then((res)=>{
                            if(res.data.data.msg=="success"){
                                _this.$alert('添加知识点成功', '提示', {
                                    confirmButtonText: '确定',
                                    callback: action => {
                                        this.$router.push("/tknowledge")
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
