<template>
    <div>
        <el-form ref="form" :model="formData" label-position="right" :rules="ruleForm">
            <com-ocj-form-item :form="formData" :config="formConfig" :column="1" clearable>
                <template #submitBtn>
                    <div class="mt-12">
                        <el-button type="primary" @click="submit">确定</el-button>
                        <el-button @click="closeDialog">取消</el-button>
                    </div>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>
<script>
import api from '@/api/member'  //引入member封装了的API
export default {
    name:'addPlan',
    inject:['index'],
    props:{
        rowData:Object
    },
    data(){
        return{
            // 限制时间不让选择今天以前的
            pickerOptions: {
                disabledDate(time) {
                    return time.getTime() < Date.now()-1 * 24 * 3600 * 1000;
                }
            },
            //锁定表单项
            disabled:false,
            //表单数据
            formData:{},
            moduleList:{},
            codeKeyList:[],
            p_name:'',
            //表单验证
            ruleForm:{
                username: [
                    {required: true, message: "请输入用户名",trigger: "blur"},
                ],
                password: [
                    {required: true, message: "请输入密码",trigger: "blur"},
                ],
                name: [
                    {required: true, message: "请输入姓名",trigger: "blur"},
                ],
                codeKey: [
                    {required: true, message: "请输入邀请码编号",trigger: "blur"},
                ],
            },
        };
    },
    computed:{
        //表单配置,放在计算属性中，时间选择需要限制
        formConfig(){
            let item1 = [
              {itemType:'input',prop:'username',label:'用户名',placeholder:'请输入用户名',width:'320px'},
              {itemType:'input',prop:'password',label:'密码',placeholder:'请输入密码',width:'320px'},
              {itemType:'input',prop:'name',label:'姓名',placeholder:'请输入姓名',width:'320px'},
              {itemType:'',prop:'submitBtn',label:'',hasSlot:true}
            ]
            return item1
        }
    },
    created() {
        if (this.rowData){
            this.formData = this.rowData;
            this.p_name = this.rowData.p_name__name
            //console.log(this.rowData)
        }
    },
    mounted() {

    },
    methods:{
        closeDialog(){
            this.$parent.$listeners.close()
        },
        submit(){
            this.$refs['form'].validate(valid => {
                if(valid){
                  this.save()
                }
            });
        },
        //  保存
        async save() {
          let res = await api.addAdmin(this.formData)
          this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
          this.closeDialog()
          this.index.fetchData()
        },
    }
};
</script>
<style scoped>
    .btn_right{
        text-align: right;
        margin: 30px 0px;
    }
</style>
