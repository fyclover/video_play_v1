<template>
  <div class="card">
    <ul>
      <li v-for="(item, index) in dataList" :key="index" :style="dataListStyle">
        <svg class="svg-icon " aria-hidden="true"><use :xlink:href="item.icon"></use></svg>
        <span class="des">{{item.des}}</span>
        <count-to class="number" :startVal='item.startVal' :endVal='item.endVal' :duration='1500' separator='' />
      </li>
    </ul>
      <br>
      <ul>
         <li v-for="(item, index) in dataListss" :key="index" :style="dataListStyle">
           <svg class="svg-icon " aria-hidden="true"><use :xlink:href="item.icon"></use></svg>
           <span class="des">{{item.des}}</span>
           <count-to class="number" :startVal='item.startVal' :endVal='item.endVal' :duration='1500' separator='' />
         </li>
       </ul>

  </div>
</template>

<script>
  import countTo from 'vue-count-to'
  import {
getRegisterTodayApi,
getRegisterTotalApi,
getRechargeTodayApi,
getRechargeTotalApi,
getWithdrawalTodayApi,
getWithdrawalTotalApi,
getOrderTodayPayApi,
getOrderTotalPayApi,
getOrderTotalMoneyApi,
getOrderTodayMoneyApi,
getRegisterApi,
getRechargeApi,
getWithdrawalApi,
getOrderApi,
    } from '@/api/CountApi'
  export default {
    name: "ConsoleCard",
    components: {
      countTo
    },
    data() {
      return {
        startVal: 0,
        dataList: [
          {
            des: '总注册人数',
            icon: '#iconyonghu1',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 24,
            height: 26,
          },
          {
            des: '今日注册人数',
            icon: '#iconyonghu1',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 24,
            height: 25
          },
          {
            des: '总充值金额',
            icon: '#iconsidebar',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 27,
            height: 25
          },
          {
            des: '今日充值金额',
            icon: '#iconsidebar',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 24,
            height: 25,
          },
          {
            des: '总提现金额',
            icon: '#iconquyufangwenqushi',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 24,
            height: 24
          },
          {
            des: '今日提现金额',
            icon: '#iconquyufangwenqushi',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 27,
            height: 25
          },
        ],
        dataListss:[
          {
            des: '总订单数',
            icon: '#iconshalou',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 27,
            height: 25
          },
          {
            des: '今日订单数',
            icon: '#iconshalou',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 27,
            height: 25
          },
          {
            des: '总订单金额',
            icon: '#iconchuli',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 27,
            height: 25
          },
          {
            des: '今日订单金额',
            icon: '#iconchuli',
            startVal: 0,
            duration: 1000,
            endVal: 0,
            width: 27,
            height: 25
          },

        ],
        endVal: 2020,
        duration: 1000,
        dataListStyle: {},
      };
    },
    mounted() {
      this.computedItemWidth()
      this.getUserList()
    },
    methods: {
      getUserList(){//endVal
      //注册
        getRegisterApi().then(res => {
          this.dataList[0].endVal=res.data.total
          this.dataList[1].endVal=res.data.today
        }),
        //充值
        getRechargeApi().then(res => {
          this.dataList[2].endVal=res.data.total
          this.dataList[3].endVal=res.data.today
        }),
        //提现
        getWithdrawalApi().then(res => {
          this.dataList[4].endVal=res.data.total
          this.dataList[5].endVal=res.data.today
        }),
        getOrderApi().then(res => {
          this.dataListss[0].endVal=res.data.total
          this.dataListss[1].endVal=res.data.today
        }),
        getOrderTotalMoneyApi().then(res => {
          this.dataListss[2].endVal=res.data.total
        }),
        getOrderTodayMoneyApi().then(res => {
          this.dataListss[3].endVal=res.data.total
        })
        },
      computedItemWidth() {
        let count = this.dataList;
        let width = 100 / count;

        this.dataListStyle = {
          width: `calc(${width}% - 20px)`
        }
      }
    }
  };
</script>

<style lang="scss" scoped>
  .card {
    overflow: hidden;
    background: transparent !important;

    ul {
      width: calc(100% + 15px);
      margin-left: -15px;
      display: flex;
      flex-wrap: wrap;
      box-sizing: border-box;
      background: transparent !important;

      li {
        width: calc(16.666% - 15px);
        height: 125px;
        line-height: 125px;
        text-align: center;
        margin: 0 0 0 15px;
        box-sizing: border-box;
        background: #fff;
        display: flex;
        justify-content: space-between;
        padding: 0 40px;
        position: relative;
        border-radius: 3px;
        box-shadow: 0 0px 7px rgba(28,76,186,.08);
        transition: box-shadow .3s;

        &:hover {
          box-shadow: 0 5px 20px rgba(28,76,186,.12);
        }

        .svg-icon {
          width: 3em;
          height: 3em;
          vertical-align: -0.15em;
          fill: currentColor;
          overflow: hidden;
          position: absolute;
          top: 50%;
          transform: translate(0, -50%);
          -moz-transform: translate(0, -50%);
          -webkit-transform: translate(0, -50%);
          bottom: 0;
          left: 10%;
        }

        .number {
          color: #515a6e;
          font-size: 26px;
          line-height: 26px;
          margin: 0;
          position: absolute;
          bottom: 50%;
          right: 10%;
        }

        .des {
          color: #999999;
          font-size: 13px;
          line-height: 14px;
          height: 14px;

          position: absolute;
          bottom: 30%;
          right: 10%;
          user-select: none;
          -moz-user-select: none;
          -webkit-user-select: none;
        }

      }
    }
  }

  @media only screen and (max-width: $device-notebook)  {
    .card {
      padding-top: 0 !important;

      ul {
        li {
          height: 100px;

          .des {
            font-size: 12px;
          }
        }
      }

      .iconfont {
        left: 15px !important;
      }

      .number, .des {
        right: 15px !important;
      }
    }
  }

  @media only screen and (max-width: $device-ipad) {
    .card {

      ul {
        width: calc(100% + 15px);
        margin-left: -15px;
        display: flex;
        flex-wrap: wrap;
        box-sizing: border-box;

        li {
          width: calc(33.333% - 15px);
          height: 120px;
          line-height: 120px;
          margin-bottom: 15px;
        }
      }
    }
  }

  @media only screen and (max-width: $device-phone) {
    .card {

      ul {
        width: calc(100% + 15px);
        margin-left: -15px;
        display: flex;
        flex-wrap: wrap;
        box-sizing: border-box;

        li {
          width: 100%;
          height: 100px;
          line-height: 100px;
          margin-bottom: 10px;
        }
      }
    }
  }
</style>
