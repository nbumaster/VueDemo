<template>
    <div class="limitHeight" id="chatContent">
      <div class="outPut" v-for="(item,index) in outPut" :key="index">
        {{ item }}
      </div>
    </div>
</template>
<script>
import api from '@/api/demo'
export default {
    name:'addData',
    inject:['index'],
    props:{
      executeId:{
        type: Number
      }
    },
    data(){
        return{
            //表单数据
            formData:{},
            outPut:[],
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
        //console.log(this.formData)
      }
    },
    mounted(){
      this.initWebSocket()
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
        let res = await api.addDemoData({...this.formData})
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.closeDialog()
        this.index.fetchData()
      },
      //websocket处理
      initWebSocket(){//建立连接
        //初始化weosocket
        const wsuri = 'ws://127.0.0.1:8000/'+localStorage.getItem('username')
        this.websock = new WebSocket(wsuri);  //建立连接
        this.websock.onopen = this.open;  //连接成功
        this.websock.onerror = this.error;  //连接错误
        this.websock.onmessage = this.getMessage; //接收信息
        this.websock.onclose = this.close;  //连接关闭
      },
      open() {
        let that = this
        console.log("socket连接成功, 并开始执行命令")
        let data = {
          exe: 'ping',
          id: this.executeId
        }
        this.send(JSON.stringify(data))
      },
      error: function () {
        let that = this
        console.log("连接错误")
        //setTimeout(this.initWebSocket(that.code), 4000);//延迟重连
      },
      getMessage: function (response) {
          console.log(response.data)
        //将滚动条移到底部，显示最新消息
        this.$nextTick(() => {
          this.outPut.push(response.data)
          let div = document.getElementById('chatContent')
          div.scrollTop = div.scrollHeight
        })
        let isComplate = response.data.split('<===>')
        if (isComplate.length == 2){
          let id = isComplate[1].split('=')
          this.save(id[1], this.outPut)
          //console.log('命令执行完成，保存 id=' +id[1]+'到数据库...')
        }
      },
      send(data) {
        this.websock.send(data)      // 发送给后台的数据
      },
      close() {
        let that = this
        console.log("socket已经关闭,重连")
      },
      async save(id, recordInfo){
        let formData = {
          id: id,
          recordInfo: recordInfo
        }
        let res = await api.saveRecord(formData)
        this.$message({message: res.message, type: res.code === 20000 ?'success':'error'})
        this.index.fetchData()
      }
    }
};
</script>
<style scoped>
  .outPut{
    font-size:14px;
    line-height: 26px;
  }
  .success{
    color: red;
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
