<template>
  <ion-page>
    <ion-header class="topHeader">
      <ion-grid>
        <ion-row>
          <ion-col lg="5" md="6" sm="5">
            <ion-img src="/img/kalogo.svg" class="logo"></ion-img>
          </ion-col>
          <ion-col lg="7" md="6" sm="7">
            <div class="headlineContainer">
              <span class="headline">CO<sub>2</sub> Runter: App</span>
            </div>
          </ion-col>
        </ion-row>
      </ion-grid>
    </ion-header>

   
    <ion-content :fullscreen="true">
    <!-- responsive grid -->
    <ion-grid>
      <ion-row>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>1 of 4</div>
          </ion-card>
        </ion-col>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>2 of 4</div>
          </ion-card>
        </ion-col>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>3 of 4</div>
          </ion-card>
        </ion-col>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>4 of 4</div>
          </ion-card>
        </ion-col>
      </ion-row>
    </ion-grid>

    <ion-grid>
      <ion-row>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>1 of 4</div>
          </ion-card>
        </ion-col>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>2 of 4</div>
          </ion-card>
        </ion-col>
      </ion-row>
      <ion-row>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>3 of 4</div>
          </ion-card>
        </ion-col>
        <ion-col size="12" size-sm>
          <ion-card>
          <div>4 of 4</div>
          </ion-card>
        </ion-col>
      </ion-row>
    </ion-grid>

    </ion-content>

    <ion-footer :translucent="true">
      <ion-toolbar>
      <ion-button expand="block" fill="outline" class="routelink" router-link="/home">Home</ion-button>
      </ion-toolbar>
    </ion-footer>
  </ion-page>
</template>

<script lang="ts">
import { IonContent, IonHeader, IonFooter, IonPage, 
IonToolbar, 
IonImg, 
IonButton,
IonGrid, IonRow, IonCol,
IonCard,

 } from '@ionic/vue';
import { defineComponent } from 'vue';

export default defineComponent({
  name: 'ImPrint',
  components: {
    IonContent,
    IonHeader,
    IonPage,
    IonToolbar,
    IonFooter,
    IonImg,
    IonButton,
    IonGrid, IonRow, IonCol,
    IonCard,
  }
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

/* custom */
.routelink, .submit {
  margin-left: 20%;
  margin-right: 20%;
}


.topHeader {
  background: white;
}
/*
.logo {
  height: 4rem;
  max-width: 40%;
  padding: .5rem 1rem .5rem .5rem;
}
*/
.logo {
  height: 3rem;
  width: 100%;
  padding: 0;
  object-position: left;
}

.appdesign {
  height: 3rem;
  /*
  width: 100%;
  padding: 0;
  object-position: left;
  */
}

.headlineContainer {
  display: flex;
  justify-content: left;
  align-items: flex-end;
  height: 100%;
  font-size: 1.9rem;
  font-weight: bold;
}
.headline {
  margin-bottom: -.4rem;
}


.topHeader1 {
  background: white;
  position:relative;
}
.logo1 {
  position:absolute;
  top:0;
  left:0;
  height: 4rem;
  padding: .5rem 2rem .5rem 2rem;
}

/* we can style boxes like so */
ion-checkbox {
  --border-width: 4px;
}

/* segments */
ion-content ion-segment {
  margin: 5px 0;
}

ion-segment-button {
  --background: #eee;
  --background-checked: #00ff00;
  color: #333;
  font-size: 1rem;
}

ion-card {
  color: #333;
  font-size: 1rem;
}
ion-card-subtitle {
  color: #333;
  font-size: 1rem;
  font-weight: bold;
}

ion-card-content {
  font-size: 1rem;
}

ion-card-content p {
  font-size: 1rem;
}

.check  {
  font-size: 20px;
}

.sector {
  border-bottom: solid 2px;
  border-radius: 10px;
  margin-bottom: 2rem;
}
/* smaller content on large screen */
@media only screen and (min-width: 992px) {
  .card-md {
    max-width: 960px;
    margin-left:auto;
    margin-right:auto;
  }
}

/* smaller padding on small screen */
@media only screen and (max-width: 480px) {
ion-item {
  --padding-start: 5px;
  }
  .logo {
    height: 2rem;
  }
  .headline {
    font-size: 1.3rem;
  }
}

</style>
