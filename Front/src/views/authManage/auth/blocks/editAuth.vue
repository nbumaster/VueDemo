<template>
  <div>
    <el-form ref="form" :model="formData" label-position="left" :rules="ruleForm">
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
  import api from '@/api/auth' //引入member封装了的API
  export default {
    name: 'addPlan',
    inject:['index'],
    props: {
      rowData: Object
    },
    data() {
      return {
        tableList:[],
        //表单数据
        formData: {},
        //表单验证
        ruleForm: {
          name: [
            {required: true,message: "请输入名称",trigger: "blur"},
          ],
          auth_type: [
            {required: true,message: "请选择权限类型",trigger: "blur"},
          ],
          req_url: [
            {required: true,message: "请输入请求地址",trigger: "blur"},
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
            label: '权限名称',
            placeholder: '请输入用户名',
            width: '320px'
          },
          {
            itemType: 'select',
            prop: 'parent_id',
            label: '所属父级',
            placeholder: '请选择',
            width: '200px',
            listName:'name',
            listKey:'id',
            filterable:true,
            list: this.tableList,
          },
          {
            itemType: 'select',
            prop: 'auth_type',
            label: '权限类型',
            placeholder: '请选择',
            width: '200px',
            list: [{
              label: '目录',
              value: 0
            }, {
              label: '菜单',
              value: 1
            }, {
              label: '按钮',
              value: 2
            }],
          },
          {
            itemType: 'input',
            prop: 'req_url',
            label: '请求地址',
            placeholder: '请输入姓名',
            width: '320px'
          },
          {
            itemType: 'input',
            prop: 'auth_flag',
            label: '权限标识',
            placeholder: '请输入姓名',
            width: '320px'
          },
          {
            itemType: 'input',
            prop: 'component',
            label: '组件',
            placeholder: '请输入组件',
            width: '320px'
          },
          {
            itemType: 'input',
            prop: 'icon',
            label: 'icon',
            placeholder: '请输入icon',
            width: '320px'
          },
          {
            itemType: 'input',
            type:'textarea',
            rows: 3,
            prop: 'content',
            label: '备注说明',
            placeholder: '请输入备注说明',
            width: '320px'
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
      this.fetchData()
    },
    methods: {
      closeDialog() {
        this.$parent.$listeners.close()
      },
      submit() {
        this.$refs['form'].validate(valid => {
          if (valid) {
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
      //获取数据
      async fetchData() {
        let res = await api.getData()
        if (res.code === 20000) {
          this.tableList = res.data.items
        }
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
