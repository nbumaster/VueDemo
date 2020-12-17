<template>
  <div>
    <el-form ref="form" :model="formData" label-position="left" :rules="ruleForm">
      <com-ocj-form-item :form="formData" :config="formConfig" :column="1" clearable>
        <template #auths>
          <el-tree
            ref='tree'
            :data="authsList"
            show-checkbox
            node-key="id"
            :default-expand-all="true"
            :default-checked-keys="ownAuths"
            :props="defaultProps">
          </el-tree>
        </template>
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
  import api from '@/api/roles' //引入member封装了的API
  export default {
    name: 'addPlan',
    inject:['index'],
    props: {
      rowData: Object
    },
    data() {
      return {
        tableList:[],
        authsList:[],
        ownAuths:[],
        defaultProps: {
          children: 'children',
          label: 'name'
        },
        //表单数据
        formData: {},
        //表单验证
        ruleForm: {
          name: [
            {required: true,message: "请输入角色名称",trigger: "blur"},
          ]
        },
      };
    },
    computed: {
      //表单配置,放在计算属性中，时间选择需要限制
      formConfig() {
        return [{
            itemType: 'input',
            prop: 'name',
            label: '角色名称',
            placeholder: '请输入角色名称',
            width: '320px'
          },
          {
            itemType: 'input',
            type:'textarea',
            rows: 3,
            prop: 'content',
            label: '角色描述',
            placeholder: '请输入角色描述',
            width: '320px'
          },
          {
            itemType:'',
            prop:'auths',
            label: '权限选择',
            hasSlot: true
          },
          {
            itemType: '',
            prop: 'submitBtn',
            label: '',
            hasSlot: true
          }
        ];
      }
    },
    created() {
      if (this.rowData) {
        this.formData = this.rowData;
        // console.log(this.rowData)
      }
    },
    mounted() {
      this.getAuthsTree()
      this.getAuthList(this.formData.id)
    },
    methods: {
      closeDialog() {
        this.$parent.$listeners.close()
      },
      submit() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            let treeChecked = this.$refs.tree.getCheckedKeys().concat(this.$refs.tree.getHalfCheckedKeys())
            this.formData.authTree = treeChecked
            this.save()
          }
        });
      },
      //  保存
      async save() {
        let res = await api.add(this.formData)
        this.$message({
          message: res.message,
          type: res.code === 20000 ? 'success' : 'error'
        })
        this.closeDialog()
        this.index.fetchData()  //亮点：穿透N层调用父父父级组件中的方法
      },

      //获取权限树
      async getAuthsTree(){
        let res = await api.getAuthsTree({})
        if(res.code !== 20000){
          this.$message({message: res.message,type: 'error'})
        }
        this.authsList = res.data.items
      },

      //获取当前角色权限
      async getAuthList(id){
        let res = await api.getAuthList({'id':id})
        if(res.code !== 20000){
          this.$message({message: res.message,type: 'error'})
        }
        let data = res.data.items
        this.ownAuths = []
        data.forEach(item=>{
          this.ownAuths.push(item.authosKey_id)
        })
      }
    }
  };
</script>
<style scoped>
  .btn_right {
    text-align: right;
    margin: 30px 0px;
  }
</style>
