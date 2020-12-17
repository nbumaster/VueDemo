<template>
    <div class="form-content limitHeight">
        <el-form ref="form" :model="formData" label-position="right" :rules="ruleForm">
            <com-ocj-form-item :form="formData" :config="formConfig" :column="1" clearable>
                <template #submitBtn>
                    <div class="mt-12">
                        <el-button type="primary" @click="submit">确定</el-button>
                    </div>
                </template>
                <template #rate>
                  <el-input style="width: 100px;" v-model="formData.rate"></el-input> 美元
                </template>
                <template #codeKey_id>
                  <el-select v-model="formData.codeKey_id" filterable placeholder="请选择代理编号" style="width: 320px;" clearable>
                    <el-option
                      v-for="(item,index) in codeKeyList"
                      :key="index"
                      :label="item.code"
                      :value="item.id">
                    </el-option>
                  </el-select>
                </template>
                <template #rateModelValue v-if="level_type === 2">
                  <el-select v-model="formData.rateModelValue" filterable placeholder="请选择手续费模板" style="width: 520px;" clearable @change="changeRate">
                      <el-option
                        v-for="(item,index) in options"
                        :key="index"
                        :label="item.rateModelKey__label"
                        :value="item.rateModelKey__value">
                      </el-option>
                    </el-select>
                </template>
                <template #c5>
                  <span style="margin-left: 0px;">美盘</span> <el-input style="width: 80px;" v-model="formData.R1"></el-input>
                  <span style="margin-left: 20px;">恒指</span> <el-input style="width: 80px;" v-model="formData.R2"></el-input>
                  <span style="margin-left: 20px;">小恒指</span> <el-input style="width: 80px;" v-model="formData.R3"></el-input>
                  <span style="margin-left: 20px;">德指</span> <el-input style="width: 80px;" v-model="formData.R4"></el-input>
                  <span style="margin-left: 20px;">小德指</span> <el-input style="width: 80px;" v-model="formData.R5"></el-input>
                </template>
            </com-ocj-form-item>
        </el-form>
    </div>
</template>
<script>
import api from '@/api/agent'
import apiRate from '@/api/rateSet'
export default {
    name:'addPlan',
    inject:['reload'],
    props:{
      level_type:{
        type:Number
      },
      rowData:{
        type: Object
      }
    },
    data(){
        return{
            //表单数据
            formData:{
              rate:7.8,
              level:1
            },
            options: [],
            codeKeyList:[],
            level: localStorage.getItem('level'),
            //表单验证
            ruleForm:{
                username: [
                    {required: true, message: "请输入登录账号",trigger: "blur"},
                ],
                password: [
                    {required: true, message: "请输入初始密码",trigger: "blur"},
                ],
                name: [
                    {required: true, message: "请输入下级代理商名称",trigger: "blur"},
                ],
                // rateModel: [
                //     {required: true, message: "请选择手续费模板",trigger: "change"},
                // ],
                bank_name: [
                    {required: true, message: "请输入银行名称",trigger: "blur"},
                ],
                ident_num: [
                    {required: true, message: "请输入身份证号码",trigger: "blur"},
                ],
                bank_card: [
                    {required: true, message: "请输入银行卡账号",trigger: "blur"},
                ],
                bank_mobile: [
                    {required: true, message: "请输入银行绑定手机",trigger: "blur"},
                ],
                bank_lxr: [
                    {required: true, message: "请输入银行卡姓名",trigger: "blur"},
                ],
                alipay: [
                    {required: true, message: "请输入支付宝帐号",trigger: "blur"},
                ],
                rate: [
                    {required: true, message: "请输入汇率标准",trigger: "blur"},
                ],
                codeKey_id: [
                    {required: true, message: "请选择代理编号",trigger: "change"},
                ]
            },
        };
    },
    computed:{
        //表单配置,放在计算属性中，时间选择需要限制
        formConfig(){
            return [
                {itemType:'input',prop:'username',label:'登录账号(手机号)',placeholder:'请输入登录账号',width:'320px'},
                {itemType:'input',prop:'password',label:'初始密码',placeholder:'请输入初始密码',width:'320px'},
                {itemType:'input',prop:'codeKey_id',label:'代理编号',placeholder:'请选择代理编号', hasSlot:true},
                {itemType:'input',prop:'name',label:'代理商名称',placeholder:'请输入代理商名称',width:'320px'},
                {itemType:'input',prop:'rate',label:'汇率标准',placeholder:'请输入姓名',width:'320px', hasSlot:true},
                {itemType:'input',prop:'rateModelValue',label:'手续费模板',placeholder:'请选择手续费模板', hasSlot:true},
                {itemType:'input',prop:'c5',label:'手续费(单边)',placeholder:'请输入姓名',width:'320px', hasSlot:true},
                {itemType:'input',prop:'bank_lxr',label:'银行卡姓名',placeholder:'请输入银行卡姓名',width:'320px'},
                {itemType:'input',prop:'ident_num',label:'身份证号码',placeholder:'请输入身份证号码',width:'320px'},
                {itemType:'input',prop:'bank_name',label:'银行名称',placeholder:'请输入银行名称',width:'320px'},
                {itemType:'input',prop:'bank_card',label:'银行卡账号',placeholder:'请输入银行卡账号',width:'320px'},
                {itemType:'input',prop:'bank_mobile',label:'银行绑定手机',placeholder:'请输入银行绑定手机',width:'320px'},
                {itemType:'input',prop:'alipay',label:'支付宝账号',placeholder:'请输入支付宝账号',width:'320px'},
                {itemType:'',prop:'submitBtn',label:'',hasSlot:true}
            ];
        }
    },
    created() {
      if(this.rowData){
        this.formData = this.rowData
        console.log(this.formData)
      }
    },
    mounted(){
      if(!this.rowData){
        this.getRate()
      }
      this.getFeeModel()
      this.getAgentCode()
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
				console.log(this.formData)
        let res = await api.add({...this.formData})
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.reload()
      },
      changeRate(){
        let rateItem = this.formData.rateModelValue.split(",")
        if (rateItem){
          this.formData.R1 = rateItem[0]
          this.formData.R2 = rateItem[1]
          this.formData.R3 = rateItem[2]
          this.formData.R4 = rateItem[3]
          this.formData.R5 = rateItem[4]
        }
      },
      //获取代理编号
      async getAgentCode() {
        let res = await api.getAgentCode({})
        console.log(res.data)
        this.codeKeyList = res.data.items
      },
      //获取汇率值
      async getRate() {
        let res = await apiRate.rateDefaultGet()
        this.formData.rate = res.data.items[0].USD
      },
      //获取手续费模板数据
      async getFeeModel() {
        let res = await api.getFeeModel({'filter_keyword':'all'})
        this.options = res.data.items
      },
    }
};
</script>
<style scoped>
  .btn_right{
    text-align: right;
    margin: 30px 0px;
  }
  .limitHeight{
    height: calc(100vh - 200px);
    overflow: auto;
  }
  .limitHeight::-webkit-scrollbar {
    /*滚动条整体样式*/
    width : 10px;  /*高宽分别对应横竖滚动条的尺寸*/
    height: 1px;
  }
  .limitHeight::-webkit-scrollbar-thumb {
    /*滚动条里面小方块*/
    border-radius: 10px;
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    background   : #535353;
  }
  .limitHeight::-webkit-scrollbar-track {
    /*滚动条里面轨道*/
    box-shadow   : inset 0 0 5px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    background   : #ededed;
  }
</style>
