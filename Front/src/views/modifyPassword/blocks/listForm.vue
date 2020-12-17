<template>
    <div class="page-content" v-loading="loading">
        <el-form ref="form" :model="formData" :rules="ruleForm">
            <com-ocj-form-item :column="1" :form="formData" :config="config">
                <template #searchProduct>
                    <div style="float: left;">
                      <el-button type="primary" @click="handleSubmit" size="small">确定</el-button>
                    </div>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>

<script>
  import api from '@/api/member'
  export default {
    inject:['reload'],
    name :'listForm',
    data () {
      return {
          // 表单数据
          formData:{},
          loading: false,
          config:[
              {itemType:"input",type:"password",prop:"old_password",label:"当前密码", width:'320px', showPassword:true, placeholder:'请输入旧密码'},
              {itemType:"input",prop:"new_password",type:"password",label:"设置新密码", width:'320px', showPassword:true, placeholder:'请输入新密码'},
              {itemType:"input",prop:"new_password2",type:"password",label:"确认新密码", width:'320px', showPassword:true, placeholder:'请输入确认密码'},
              {itemType:'',prop:'searchProduct',label:'',hasSlot:true}
          ],
          ruleForm: {
            old_password: [
              {required: true, message: "请输入旧密码",trigger: "blur"},
            ],
            new_password: [
              {required: true, message: "请输入新密码",trigger: "blur"},
            ],
            new_password2: [
              {required: true, message: "请输入确认密码",trigger: "blur"},
            ]
          }
      };
    }, //data end
    methods:{
      handleSubmit(){
        this.$refs['form'].validate(valid=>{
          if(valid){
            if(this.formData.new_password !== this.formData.new_password2){
              this.$message({message: '两次输入的密码不一致！', type:'error'})
              return false
            }
            this.save()
          }else{
            console.log('验证失败')
          }
        })
      },
      //  保存
      async save() {
        this.loading = true
        let res = await api.modifyPassword(this.formData)
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.loading = false
      }
    } //methods end
  };
</script>
