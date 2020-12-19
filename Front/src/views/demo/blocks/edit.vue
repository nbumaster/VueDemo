<template>
    <div class="limitHeight">
        <el-form ref="form" :model="formData" label-position="right" label-width="80px" :rules="ruleForm">
          <el-tabs>
            <el-tab-pane label="选项卡1">
              <!--
                label: 表单字段标题
                prop: 如果需要验证此项则输入与v-model绑定值相同变量
              -->
              <el-form-item label="字段1" style="margin-top:20px" prop="c1">
                <el-input v-model="formData.c1"></el-input>
              </el-form-item>
              <el-form-item label="字段2" prop="c2">
                <el-date-picker
                  v-model="formData.c2"
                  type="date"
                  placeholder="选择日期">
                </el-date-picker>
              </el-form-item>
              <el-form-item label="字段3" prop="c3">
                <el-checkbox-group v-model="formData.c3">
                  <el-checkbox label="复选框 A"></el-checkbox>
                  <el-checkbox label="复选框 B"></el-checkbox>
                  <el-checkbox label="复选框 C"></el-checkbox>
                </el-checkbox-group>
              </el-form-item>
              <el-form-item label="字段4" prop="c4">
                <el-radio-group v-model="formData.c4">
                  <el-radio :label="1">备选项1</el-radio>
                  <el-radio :label="2">备选项2</el-radio>
                  <el-radio :label="3">备选项3</el-radio>
                </el-radio-group>
              </el-form-item>
              <el-form-item label="字段5" prop="c5">
                <el-select v-model="formData.c5" placeholder="请选择" clearable style="width: 320px">
                  <el-option label="选项1" value="1"></el-option>
                  <el-option label="选项2" value="2"></el-option>
                  <el-option label="选项3" value="3"></el-option>
                  <el-option label="选项4" value="4"></el-option>
                  <el-option label="选项5" value="5"></el-option>
                </el-select>
              </el-form-item>
              <el-form-item label="字段6" prop="c6">
                <el-input v-model="formData.c6"></el-input>
              </el-form-item>
            </el-tab-pane>
            <el-tab-pane label="选项卡2">
              <el-form-item label="字段7" style="margin-top:20px">
                <el-input v-model="formData.c7"></el-input>
              </el-form-item>
              <el-form-item label="字段8">
                <el-input v-model="formData.c8"></el-input>
              </el-form-item>
              <el-form-item label="字段9">
                <el-input v-model="formData.c9"></el-input>
              </el-form-item>
            </el-tab-pane>
          </el-tabs>
          <el-form-item>
            <el-button type="primary" @click="submit">保存</el-button>
          </el-form-item>
        </el-form>
    </div>
</template>
<script>
import api from '@/api/demo'
export default {
    name:'addData',
    inject:['index'],
    props:{
      rowData:{
        type: Object
      }
    },
    data(){
        return{
            //表单数据
            formData:{
              c3:[]
            },
            //表单验证
            ruleForm:{
                c1: [
                    {required: true, message: "请输入字段1",trigger: "blur"},
                ],
                c2: [
                    {required: true, message: "请输入字段2",trigger: "blur"},
                ],
                c3: [
                    {required: true, message: "请输入字段3",trigger: "blur"},
                ],
                c4: [
                    {required: true, message: "请输入字段4",trigger: "blur"},
                ],
                c5: [
                    {required: true, message: "请输入字段5",trigger: "blur"},
                ],
                c6: [
                    {required: true, message: "请输入字段6",trigger: "blur"},
                ]
            },
        };
    },
    created() {
      if(this.rowData){
        this.formData = this.rowData
        console.log(this.formData)
      }
    },
    mounted(){

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
        let res = await api.addDemoData(this.formData)
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.closeDialog()
        this.index.fetchData()
      },
    }
};
</script>
<style scoped>
  .el-input{
    width: 320px;
  }
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
