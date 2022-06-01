<template>
  <ion-page>
    <!--    
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-title>Blank</ion-title>
      </ion-toolbar>
    </ion-header>
    -->
    <ion-header class="topHeader">
      <ion-title>CO2App</ion-title>
      <ion-img src="/img/logo.svg" class="logo"></ion-img>
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
IonTitle, IonToolbar, IonImg, 
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
    IonTitle,
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

.logo {
  height: 4rem;
}

.routelink {
  margin-left: 20%;
  margin-right: 20%;
}

.topHeader {
  background: white;
}

ion-col {
  height: 50px;
  background: grey;
  margin:5px;
}

/*
breakpoints, https://ionicframework.com/docs/layout/grid
Name	Value	Width Prefix	Offset Prefix	Push Prefix	Pull Prefix	Description
xs	0	size-	offset-	push-	pull-	Set columns when (min-width: 0)
sm	576px	size-sm-	offset-sm-	push-sm-	pull-sm-	Set columns when (min-width: 576px)
md	768px	size-md-	offset-md-	push-md-	pull-md-	Set columns when (min-width: 768px)
lg	992px	size-lg-	offset-lg-	push-lg-	pull-lg-	Set columns when (min-width: 992px)
xl	1200px	size-xl-	offset-xl-	push-xl-	pull-xl-	Set columns when (min-width: 1200px)
*/
</style>
