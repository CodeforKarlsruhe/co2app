<template>

<teleport to="head">
<meta name="description" content="Chart1"/>
</teleport>

  <vue-echarts :option="option"  class="chart" ref="chart" />

</template>

<script>

//import * as echarts from 'echarts';

//var chartDom = document.getElementById('main');
//var myChart = echarts.init(chartDom);

import { VueEcharts } from 'vue3-echarts';

import { ref } from "vue"

//  npm install  vue-window-size
import { useWindowSize } from 'vue-window-size';

const chartOption = {
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      type: 'shadow'
    }
  },
  legend: {},
  /*
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  */
  grid: [
    {
    left: '3%',
    right: '65%',
    bottom: '3%',
    containLabel: true
  },
    {
    left: '38%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  ],
  xAxis: [
    {
      type: 'category',
      data: [2022],
      gridIndex: 0 
    },
    {
      type: 'category',
      data: [2022,2025,2030,2035,2040],
      gridIndex: 1 
    }
  ],
  yAxis: [
    {
      type: 'value',
      gridIndex: 0,
    },
    {
      type: 'value',
      gridIndex: 1,
    }
  ],
  series: [
    {
      name: 'Sector1',
      type: 'bar',
      label: {
        normal: {
          // Options: 'left', 'right', 'top', 'bottom', 'inside', 'insideTop', 'insideLeft', 'insideRight', 'insideBottom', 'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
          position: 'top',
          distance: 10,

          show: true,
          formatter: ['UBA'].join('\n'),
          backgroundColor: '#eee',
          borderColor: '#555',
          borderWidth: 2,
          borderRadius: 5,
          padding: 10,
          fontSize: 18,
          color: '#000'
        },
      },
      //barWidth: 100,
      stack: 'UBA',
      emphasis: {
        focus: 'series'
      },
      data: [5]
    },
    {
      name: 'Sector2',
      type: 'bar',
      stack: 'UBA',
      emphasis: {
        focus: 'series'
      },
      data: [3.2]
    },
    {
      name: 'Sector3',
      type: 'bar',
      stack: 'UBA',
      emphasis: {
        focus: 'series'
      },
      data: [3.1]
    },

    {
      name: 'Sector1',
      type: 'bar',
      label: {
        normal: {
          // Options: 'left', 'right', 'top', 'bottom', 'inside', 'insideTop', 'insideLeft', 'insideRight', 'insideBottom', 'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
          position: 'top',
          distance: 10,

          show: true,
          formatter: ['NOW'].join('\n'),
          backgroundColor: '#eee',
          borderColor: '#555',
          borderWidth: 2,
          borderRadius: 5,
          padding: 10,
          fontSize: 18,
          color: '#000'
        },
      },
      //barWidth: 100,
      stack: 'Local',
      emphasis: {
        focus: 'series'
      },
      data: [4.4]
    },
    {
      name: 'Sector2',
      type: 'bar',
      stack: 'Local',
      emphasis: {
        focus: 'series'
      },
      data: [5]
    },
    {
      name: 'Sector3',
      type: 'bar',
      stack: 'Local',
      emphasis: {
        focus: 'series'
      },
      data: [2]
    },
    {
      name: 'Sector1',
      //color: "#00ff00",
      //label: "KA",
      label: {
        normal: {
          // Options: 'left', 'right', 'top', 'bottom', 'inside', 'insideTop', 'insideLeft', 'insideRight', 'insideBottom', 'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
          position: 'top',
          distance: 10,

          show: true,
          formatter: ['KA'].join('\n'),
          backgroundColor: '#eee',
          borderColor: '#555',
          borderWidth: 2,
          borderRadius: 5,
          padding: 10,
          fontSize: 18,
          color: '#000'
        },
      },
      type: 'bar',
      //barWidth: 100,
      stack: 'KA',
      data: [4]
    },
    {
      name: 'Sector2',
      //color: "#ff00ff",
      type: 'bar',
      stack: 'KA',
      data: [5]
    },
    {
      name: 'Sector3',
      type: 'bar',
      stack: 'KA',
      data: [3],
      markpoint: {
        symbolSize: 1,
        symbolOffset: [0, '50%'],
        label: {
          show:true,
          position: 'right',
          distance: 20,
        },
        data: [
          {
              name: 'maximum',
              type: 'max'
          },
      ] 
      },
      /*
      markLine: {
        lineStyle: {
          type: 'dashed',
          width: 3,
        },
        data: [
          [{
            // Mark line with a fixed X position in starting point. This is used to generate an arrow pointing to maximum line.
              name: "KA Klimaschutz",
              lineStyle: {
                type: 'dashed',
                width: 7,
                color: "#00ff00",
              },
              label: {
                show:true,
                position: "middle"
              },
              yAxis: 12,
              xAxis: '2022'
          }, {
              yAxis: 0, //'min',
              xAxis: "2040", //"90%"
          }],
        ]
      },
    */
    },

    // 
    {
      name: 'Summe',
      type: 'bar',
      xAxisIndex: 1, yAxisIndex: 1 ,
      /*
      label: {
        normal: {
          // Options: 'left', 'right', 'top', 'bottom', 'inside', 'insideTop', 'insideLeft', 'insideRight', 'insideBottom', 'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
          position: 'top',
          distance: 10,
          show: true,
          formatter: ['Summe'].join('\n'),
          backgroundColor: '#eee',
          borderColor: '#555',
          borderWidth: 2,
          borderRadius: 5,
          padding: 10,
          fontSize: 18,
          color: '#000'
        },
      },
      */
      //barWidth: 5,
      data: [12,7,0,0,0],
      markpoint: {
        symbol: "pin",
        symbolSize: 50,
        //symbolOffset: [0, '50%'],
        label: {
          show:true,
          position: 'right',
          distance: 2,
        },
        data: [
        {
            name: 'fixed x position',
            yAxis: 5,
            x: '50%'
          }, 
        ] 
      },
      markLine: {
        lineStyle: {
          type: 'dashed',
          width: 3,
        },
        data: [
          [{
            // Mark line with a fixed X position in starting point. This is used to generate an arrow pointing to maximum line.
              name: "Paris 1.5 Grad Ziel",
              lineStyle: {
                type: 'dashed',
                width: 7,
              },
              label: {
                show:true,
                position: "middle"
              },
              yAxis: 'max',
              xAxis: '2022'
          }, {
              yAxis: 0, //'min',
              xAxis: "2030", //"90%"
          }],
          [{
            // Mark line with a fixed X position in starting point. This is used to generate an arrow pointing to maximum line.
              name: "KA Klimaschutz",
              lineStyle: {
                type: 'dashed',
                width: 7,
              },
              label: {
                show:true,
                position: "middle"
              },
              yAxis: 'max',
              xAxis: '2022'
          }, {
              yAxis: 0, //'min',
              xAxis: "2040", //"90%"
          }],
          {
            name: 'A horizontal line with Y valued 10',
            lineStyle: {
              type: 'solid',
              width: 3,
            },
            label: {
              show:true,
              position: "middle"
            },
            yAxis: 10
          },
          {
            name: 'average line',
            label: {
              show:true,
              position: "end"
            },
            type: 'average'
          },
        ]
      },

    },

  ]
};


export default {
  name: 'BalanceChart',
      components: {
        VueEcharts,
    },
    data ()  {
        return {
        }
    },
    watch: {
      wheight(n) {
        //console.log("h",n)
        if (this.chart) {
          //console.log(this.chart)
          //console.log(this.chart.chart)
          this.chart.chart.resize({height:Math.round(3*n/4)})
        }
      }
    },
    mounted() {
      this.wheight++ // trigger resize
    },
    setup () {
        const chart = ref({})
        const option = ref(chartOption)
        //const height = ref()
        const { width, height } = useWindowSize();
        return { chart, option, wwidth: width, wheight:height }
    }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.chart {
    /*height:400px;*/
    height:100%;
    max-width:80%;
    margin-left:auto;
    margin-right:auto;
}
</style>
