<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Improved Form</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content class="ion-padding">

      <ion-list>
          <ion-item>
            <ion-label>Coarse Setting:</ion-label>
            <ion-segment v-model="coarseSetting" class="coarse-segment" @ionChange="updateCoarseSetting">
              <ion-segment-button :value="setting.value" v-for="(setting, index) in coarseSettings" :key="index" :class="{ 'highlighted': closestCoarseSetting === setting.value }">
                {{ setting.label }}
              </ion-segment-button>
            </ion-segment>

          </ion-item>
          <ion-item>
            <ion-label>Coarse Value: {{ coarseValue.toFixed(2) }}</ion-label>
          </ion-item>
        </ion-list>

     

      <ion-accordion-group class="details-accordion">
        <ion-accordion value="details">
          <ion-item slot="header" color="light">
            <ion-label>Details</ion-label>
          </ion-item>
          <div class="ion-padding" slot="content">
            <ion-list>
            <ion-item v-for="(category, index) in categories" :key="index">
              <ion-label>{{ category }}: {{ details[category].toFixed(2) }}</ion-label>
              <ion-range
                min="0"
                max="100"
                step="1"
                :value="details[category]"
                @ionChange="updateDetails(category, $event.detail.value)"
              ></ion-range>
            </ion-item>
          </ion-list>
          </div>

        </ion-accordion>
      </ion-accordion-group>

    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonContent, IonHeader, IonToolbar, IonTitle, IonSegment, IonSegmentButton, IonList, IonItem, IonLabel, IonRange, IonSelect, IonSelectOption, IonButton, IonAccordionGroup, IonAccordion } from '@ionic/vue';
import { defineComponent } from 'vue';

interface Details {
  [category: string]: number;
}

interface CoarseSetting {
  value: string;
  label: string;
  details: Details;
}

export default defineComponent({
  components: {
    IonPage, IonContent, IonHeader, IonToolbar, IonTitle, IonSegment, 
    IonSegmentButton, IonList, IonItem, IonLabel, IonRange, 
    IonAccordionGroup, IonAccordion,
  },
  data() {
    return {
      segmentValue: 'coarse',
      coarseSetting: 'setting1',
      coarseValue: 50, // can't use function here!
      closestCoarseSetting: '', // To track the closest coarse setting
      details: {
        category1: 30,
        category2: 40,
        // Add more categories as needed
      } as Details,
      categories: ['category1', 'category2'], // Add more category names here
      coarseSettings: [
        { value: 'setting1', label: 'Setting 1', details: { category1: 30, category2: 40 } },
        { value: 'setting2', label: 'Setting 2', details: { category1: 40, category2: 60 } },
        { value: 'setting3', label: 'Setting 3', details: { category1: 60, category2: 70 } },
      ] as CoarseSetting[],
      settingsRanges: [35,50,100], // ranges
    };
  },
  methods: {
    coarseFunction(values: number[]): number {
      const sum = values.reduce((total, value) => total + value, 0);
      return values.length > 0 ? sum / values.length : 0;
    },
    updateDetails(category: string, value: string) {
      console.log("detaile update:", value)
      const numericValue = parseFloat(value);
      if (!isNaN(numericValue)) {
        this.details[category] = numericValue;
        this.coarseValue = this.calculateCoarseValue();
        console.log("Coarse:",this.coarseValue)

        // Find the closest coarse setting based on the calculated coarse value
        const closestIndex = this.settingsRanges.findIndex((range,i) => {
          console.log("Check:",this.coarseValue, range,i)
          const res = range - this.coarseValue  >= 0
          return res
        });
        if (closestIndex !== -1) {
          this.closestCoarseSetting = this.coarseSettings[closestIndex].value;
        } else {
          // this.closestCoarseSetting = 0
        }

        console.log("CLosest:",closestIndex, this.closestCoarseSetting)


      }
    },
    updateCoarseSetting() {
      console.log("coarse update")
      const selectedSetting = this.coarseSettings.find(setting => setting.value === this.coarseSetting);
      if (selectedSetting) {
        this.details = { ...selectedSetting.details };
        this.coarseValue = this.calculateCoarseValue();
        this.closestCoarseSetting = ''; // Clear the highlight class
      }
    },
    calculateCoarseValue(): number {
      const detailValues = Object.values(this.details);
      return this.coarseFunction(detailValues)
      /*
      const sum = detailValues.reduce((total, value) => total + value, 0);
      return detailValues.length > 0 ? sum / detailValues.length : 0;
      */
    },
  },
});
</script>


<style scoped>
#container {
  text-align: center;
  
  position: absolute;
  left: 0;
  right: 0;
  top: 50%;
  transform: translateY(-50%);
}

#container strong {
  font-size: 20px;
  line-height: 26px;
}

#container p {
  font-size: 16px;
  line-height: 22px;
  
  color: #8c8c8c;
  
  margin: 0;
}

#container a {
  text-decoration: none;
}

.details-accordion ion-item-group {
  border-bottom: none;
}

.accordion-toggle ion-item-option {
  --color: var(--ion-color-primary);
}

.highlighted {
  background-color: var(--ion-color-primary);
  color: white;
}


</style>
