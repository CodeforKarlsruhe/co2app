<template>
  <ion-page>
    <!-- 
    <ion-header :translucent="true">
      <ion-toolbar>
        <ion-title>Blank Title1</ion-title>
      </ion-toolbar>
    </ion-header>
    -->
    <!-- -->
    <ion-header class="topHeader">
        <ion-item class="headline-container">
          <ion-thumbnail class="logo" slot="start">
            <img alt="Logo" src="/img/kalogo.svg" />
          </ion-thumbnail>
          <ion-label class="headline">CO<sub>2</sub> runter: App</ion-label>
        </ion-item>
    </ion-header>


    <ion-content :fullscreen="true" class="onepnt5">
    
    <ion-card>
      <ion-card-header>
        <ion-card-title>CO<sub>2</sub> runter - Mein Beitrag für KA</ion-card-title>
        <ion-card-subtitle>Mitmach-App</ion-card-subtitle>
        </ion-card-header>

        <ion-card-content>
          Wie viel CO<sub>2</sub> kann ich durch einen veränderten Lebensstil einsparen und 
          wie viel macht es in meinem Stadtteil aus, wenn ich noch andere in meinem Umfeld davon überzeuge? 
          <p>
          Die zwei Aspekte zeigt spielerisch diese App, die auf dem persönlichen CO<sub>2</sub> Rechner 
          des <a href="https://uba.co2-rechner.de/" target=_blank>Umweltbundesamtes (UBA)</a> basiert und für diese Aktion vereinfacht wurde.
          </p>

          <ion-accordion-group>
            <ion-accordion value="first">
              <ion-item slot="header" color="light">
                <ion-label>Details</ion-label>
              </ion-item>
              <div class="ion-padding" slot="content">
                <p>
                Laut Energiebilanz Karlsruhe 2019 liegt der CO<sub>2</sub> Ausstoß bei 7,8t jährlich pro Kopf. 
                Die Effekte durch privaten Konsum sind dabei nicht enthalten.
                Addiert man hier den Grundwert (3,5t) gemäß unserer Vereinfachung des UBA-Modells, 
                dann erhält man 11,3t CO<sub>2</sub>. Dies entspricht ungefähr der Grundwert-Summe der CO<sub>2</sub>APP (11t CO<sub>2</sub>).
                
                </p>
                <p>
                Diese Grundwert-Summe bildet sich aus 4 "Sektoren", die wir durch unseren Lebensstil 
                beinflussen können plus einer festen Zugabe für öffentliche Infrastruktur.
                </p>
                <p>
                  <ul>
                    <li>
                      Wohnen (Heizung und Strom)
                    </li>
                    <li>
                      Mobilität
                    </li>
                    <li>
                      Ernährung
                    </li>
                    <li>
                    Allgemeiner Konsum
                    </li>
                  </ul>
                </p>
                <p>
                Die verwendeten Daten und Berechnungsmodelle sind an den CO<sub>2</sub>-Rechner des Umweltbundesamts angeleht und
                wollen die Effekte zeigen, die wir durch sparsamen oder weniger sparsamen Lebensstil erreichen können. 
                Eine exaktere Berechnung ist ohne weitere Informationen über die persönliche Situation im Einzelfall nicht möglich.
                Weitere Informationen zum UBA-Modell und den Einsparpotentialen finden sich 
                <a href="https://www.umweltbundesamt.de/publikationen/klimaneutral-leben" target=_blank>hier.</a>                
                </p>
              </div>
            </ion-accordion>
          </ion-accordion-group>

          <p>
          Persönliche Maßnahmen für den Klimaschutz werden umso erfolgreicher, wenn wir auch andere Menschen davon überzeugen.
          Geben Sie Ihren Stadtteil an und die Anzahl der Personen, die sie dort als Mitstreiter:Innen gewinnen können 
          und nehmen Sie so an der Klima-Challenge teil. Die aktuellen Ergebnisse sind auf unserem 
          <a href="https://co2dash.karlsruhe.de" target=_blank>CO<sub>2</sub>-Dashboard</a> sichtbar.
          </p>
          <p>
            Im Kanal "Grüne Stadt" der <a href="https://www.karlsruhe.de/b4/stadtverwaltung/karlsruhe-app.de" target=_blank>
            Karlsruhe-App</a> wird das Umweltamt das Projekt weiter verfolgen.
          </p>

          <ion-text color="primary">Ganz unten sehen Sie immer die aktuelle Berechnung</ion-text>          
        </ion-card-content>
    </ion-card>
  

    <ion-card class="card-md">
      <ion-card-header>
        <ion-card-title>Hier können Sie etwas tun:
        </ion-card-title>
        <ion-card-subtitle>Wohnen
            <ion-icon src="/img/emoji/tent_emoji_u1f3d5.svg" size="large"></ion-icon>
        </ion-card-subtitle>
        </ion-card-header>
        <ion-card-content class="sector">
        <ion-text>
            <p>
              Die Wohnungsgröße sowie die Energieträger für
              Heizung und Strom haben großen Einfluß auf die CO<sub>2</sub> Emissionen.
              Hier können Sie weniger (25m²) oder mehr (75m²) Wohnfläche wählen und 
              als Heizenergieträger erneuerbare Energien (EE) sowie Ökostrom (Öko) angeben.
            </p>
        </ion-text>
        <ion-segment @ionChange='segmentChanged($event,"s1")'  value="normal">

            <ion-segment-button value="besser" layout="icon-bottom">
              <!--ion-icon size="small" :icon="cameraOutline"></ion-icon-->
              <ion-icon src="/img/emoji/house_emoji_u1f3e0.svg" size="small" ></ion-icon>
              <ion-label>Kleiner</ion-label>
            </ion-segment-button>

            <ion-segment-button value="normal" layout="icon-bottom">
              <!--ion-icon :icon="cameraOutline"></ion-icon-->
              <ion-icon src="/img/emoji/house_emoji_u1f3e0.svg" size="normal" ></ion-icon>
              <ion-label>Normal</ion-label>
            </ion-segment-button>
            <ion-segment-button value="schlechter" layout="icon-bottom">
              <!--ion-icon size="large" :icon="cameraOutline" ></ion-icon-->
              <ion-icon src="/img/emoji/house_emoji_u1f3e0.svg" size="large" ></ion-icon>
              <ion-label>Größer</ion-label>
            </ion-segment-button>
          </ion-segment>

            <ion-grid fixed>
            <ion-row>
            <ion-col  size="6">
            <ion-item>
            <ion-label class="check">EE</ion-label>
            <ion-icon src="/img/emoji/fire_emoji_u1f525.svg" size="normal" ></ion-icon>
            <ion-checkbox slot="end" 
              :modelValue="sect1.renew"
              @update:modelValue="sect1.renew = $event"
              >
              </ion-checkbox>
            </ion-item>
            </ion-col>
            <ion-col  size="6">
            <ion-item>
            <ion-label class="check">Öko</ion-label>
            <ion-icon src="/img/emoji/bulb_emoji_u1f4a1.svg" size="normal" ></ion-icon>
            <ion-checkbox slot="end" 
              :modelValue="sect1.eco"
              @update:modelValue="sect1.eco = $event"
              >
              </ion-checkbox>
            </ion-item>
            </ion-col>
            </ion-row>
            </ion-grid>

       </ion-card-content>

      <ion-card-header>
        <ion-card-subtitle>Mobilität
         <ion-icon src="/img/emoji/board_emoji_u1f6f9.svg" size="large"></ion-icon>
        </ion-card-subtitle>
        </ion-card-header>
        <ion-card-content class="sector">
        <ion-text>
          <p>Die mobilitätsbedingten CO<sub>2</sub> Emissionen können durch den Verzicht auf ein Auto reduziert
            werden. Viele Flüge (z.B. 1 Transatlantikflug plus 4 europäische Flüge pro Jahr) hingegen produzieren sehr viel CO<sub>2</sub>.
          </p>
        </ion-text>
        <ion-segment @ionChange='segmentChanged($event,"s2")'  value="normal">
            <ion-segment-button value="besser" layout="icon-bottom">
              <ion-icon src="/img/emoji/bike_emoji_u1f6b2.svg" size="normal" ></ion-icon>
              <ion-label>Kein Auto</ion-label>
            </ion-segment-button>
            <ion-segment-button value="normal"  layout="icon-bottom">
              <ion-icon src="/img/emoji/mobility.svg" size="normal" ></ion-icon>
              <ion-label>Normal</ion-label>
            </ion-segment-button>
            <ion-segment-button value="schlechter" layout="icon-bottom">
              <ion-icon src="/img/emoji/plane_emoji_u2708.svg" size="normal" ></ion-icon>
              <ion-label>Viele Flüge</ion-label>
            </ion-segment-button>
          </ion-segment>

       </ion-card-content>

      <ion-card-header>
        <ion-card-subtitle>Ernährung
         <ion-icon src="/img/emoji/food_emoji_u1f355.svg" size="large"></ion-icon>
         </ion-card-subtitle>
        </ion-card-header>
        <ion-card-content class="sector">
        <ion-text>
          <p>Die Fleischproduktion sorgt für erhebliche CO<sub>2</sub> Emissionen. Hier können Sie über Ihre 
            Essgewohnheiten Einfluß nehmen.            
          </p>
        </ion-text>
        <ion-segment @ionChange='segmentChanged($event,"s3")'  value="normal">
            <ion-segment-button value="besser" layout="icon-bottom">
              <ion-icon src="/img/emoji/food_emoji_u1f955.svg" size="normal" ></ion-icon>
              <ion-label>Kein Fleisch</ion-label>
            </ion-segment-button>
            <ion-segment-button value="normal" layout="icon-bottom">
              <ion-icon src="/img/emoji/food_emoji_u1f35d.svg" size="normal" ></ion-icon>
              <ion-label>Normal</ion-label>
            </ion-segment-button>
            <ion-segment-button value="schlechter" layout="icon-bottom" >
              <ion-icon src="/img/emoji/food_emoji_u1f357.svg" size="normal" ></ion-icon>
              <ion-label>Viel Fleisch</ion-label>
            </ion-segment-button>
          </ion-segment>
       </ion-card-content>

      <ion-card-header>
        <ion-card-subtitle>
          Konsum
         <ion-icon src="/img/emoji/shopping_emoji_u1f6cd.svg" size="large"></ion-icon>
         und Geld
         <ion-icon src="/img/emoji/money_emoji_u1f4b0.svg" size="large"></ion-icon>
        </ion-card-subtitle>
        </ion-card-header>
        <ion-card-content class="sector">
        <ion-text>
          <p>Unsere Konsumausgaben sorgen ebenfalls für CO<sub>2</sub> Emissionen.
            Geringere Ausgaben (z.B. 1000€ mtl.) oder hohe Ausgaben (z.B. 4500€ mtl.) haben einen
            deutlichen Effekt. Geldanlagen in klimaschonende anstelle von konverntionellen Produkten ("grünes Konto") 
            tragen ebenfalls zur CO<sub>2</sub> Einsparung bei. 
            </p>
        </ion-text>
        <ion-segment @ionChange='segmentChanged($event,"s4")'  value="normal">
            <ion-segment-button value="besser" layout="icon-bottom">
              <ion-icon src="/img/emoji/shopping_emoji_u1f6d2.svg" size="small" ></ion-icon>
              <ion-label>Wenig</ion-label>
            </ion-segment-button>
            <ion-segment-button value="normal" layout="icon-bottom">
              <ion-icon src="/img/emoji/shopping_emoji_u1f6d2.svg" size="normal" ></ion-icon>
              <ion-label>Normal</ion-label>
            </ion-segment-button>
            <ion-segment-button value="schlechter" layout="icon-bottom" >
              <ion-icon src="/img/emoji/shopping_emoji_u1f6d2.svg" size="large" ></ion-icon>
              <ion-label>Viel</ion-label>
            </ion-segment-button>
          </ion-segment>

            <ion-grid fixed>
            <ion-row>
            <ion-col  size="12">
            <ion-item>
            <ion-label class="check">Grünes Konto</ion-label>
            <ion-icon src="/img/emoji/stock_emoji_u1f4c8.svg" size="normal" ></ion-icon>
            <ion-checkbox slot="end" 
              :modelValue="sect4.stock"
              @update:modelValue="sect4.stock = $event"
              >
              </ion-checkbox>
            </ion-item>
            </ion-col>
            </ion-row>
            </ion-grid>


       </ion-card-content>
    </ion-card>

    <ion-card class="card-md">
      <ion-card-header>
        <ion-card-title>Weitersagen</ion-card-title>
        <ion-card-subtitle>Können Sie in Ihrem Stadtteil Mitstreiter gewinnen?</ion-card-subtitle>
        </ion-card-header>

        <ion-card-content v-if="districtsLoaded">
          <ion-item>
            <ion-label>Stadtteil</ion-label>
            <!-- 
              https://forum.vuejs.org/t/using-v-model-on-custom-component-with-select/32921/5
               <select :value="modelValue" @input="$emit('update:modelValue', $event.target.value)">
        <option :value="null">– Select a ... –</option>
            -->
            <ion-select  
              ok-text="OK" 
              cancel-text="Abbrechen" 
              placeholder="Bitte wählen"
              @ionChange='districtChanged($event)'
            >
              <ion-select-option value="0">Bitte wählen</ion-select-option>
              <ion-select-option v-for="item in districts" 
                :key="item.idx" 
                :value="item.idx"
                :modelValue="district"
                :text="item.name"
                >
                {{item.name}}
                </ion-select-option>
            </ion-select>
          </ion-item>
        </ion-card-content>

        <ion-card-content>
        <ion-text>
          <p>Können Sie weitere Menschen in Ihrem Stadtteil davon überzeugen,
          genauso viel CO<sub>2</sub>-Einsparungen zu erreichen? Dann geben Sie hier eine Zahl ein. 
          </p>
        </ion-text>
          <ion-item>
            <ion-range 
              min="0" 
              max="50" 
              color="secondary"
              :modelValue="mult"
              @update:modelValue="mult = $event"
            >
              <!--ion-label slot="start">0</ion-label-->
              <ion-label slot="end">{{ mult }}</ion-label>
            </ion-range>
            <!--ion-label>{{ mult }}</ion-label-->
          </ion-item>

       </ion-card-content>
    </ion-card>

    <ion-card  class="card-md">
      <ion-card-header>
        <ion-card-title>Auswerten</ion-card-title>
        <ion-card-subtitle>
            Ihr Vergleich zum Durchschnitt: {{ performance }}
        </ion-card-subtitle>
        </ion-card-header>

        <ion-card-header>
        <ion-card-title>Mitmachen</ion-card-title>
        Senden Sie Ihre Angaben ab für <em>
        CO<sub>2</sub> runter – mein Beitrag für KA</em>
        </ion-card-header>
    
      <ion-card-footer>
      <ion-button expand="block" class="submit" @click="submit">Abschicken</ion-button>
      <!--
      <ion-button expand="block" fill="outline" class="routelink" href="https://ok-lab-karlsruhe.de/impressum/">Impressum</ion-button>
      -->

      <!--
      -->
      <ion-button expand="block" fill="outline" class="routelink" href="https://www.karlsruhe.de/impressum">Impressum</ion-button>

      <ion-row>
      <ion-col size="12">
        <div class="ion-text-center">
          App-Design
        </div>
      </ion-col>
      </ion-row>

      <ion-row>
      <ion-col size="8" offset="2">
          <div class="ion-text-center">
          <ion-img slot="start" src="/img/logo.svg" class="appdesign" alt="OK Lab Karlsruhe"></ion-img>
          <ion-label><a href="https://ok-lab-karlsruhe.de" target="_blank">OK Lab Karlsruhe</a></ion-label>
        </div>
      </ion-col>
      </ion-row>

      </ion-card-footer>

      <!--
      <ion-card-content>
        <ion-img :src="axImg" alt="axImg" style="height:64px;"></ion-img>
        <ion-text>{{ axData }} </ion-text>
      </ion-card-content>
      -->

    </ion-card>
    <!--
    <ion-button @click="presentAlert">Show Alert</ion-button>
    -->
    </ion-content>
    <!--
    <ion-footer>
    <div v-for="f in form" :key="f.val">
      Checked: {{ f.val }} - {{ f.isChecked }}
    </div>
    <div>
      Also checked: {{ chk.val }} - {{ chk.isChecked }}
    </div>
    </ion-footer>
    -->

    <ion-footer :translucent="true">
      <ion-item>
      <ion-label class="totalco2">Aktuell: {{ co2total }} t CO<sub>2</sub></ion-label>
      </ion-item>
    </ion-footer>
    <!--
    <ion-footer :translucent="true">
      <ion-toolbar>
      <ion-item>
      <ion-label class="totalco2" slot="start">Aktuell: {{ co2total }} t CO<sub>2</sub></ion-label>
      <ion-button slot="end" expand="block" fill="outline" class="routelink" router-link="/imprint">Impressum</ion-button>
      </ion-item>
      </ion-toolbar>
    </ion-footer>
    -->
  </ion-page>
</template>

<script lang="ts">
import { IonContent, IonHeader, IonFooter, IonPage,  
  //IonToolbar, 
  IonImg,
  IonCard, IonCardTitle, IonCardSubtitle, IonCardHeader, IonCardContent, 
  IonItem, 
  IonCheckbox,
  IonLabel,
  IonText,
  IonRange,
  IonGrid, IonRow, IonCol,
  IonButton,
  IonAccordion,IonAccordionGroup,
  IonSegment, IonSegmentButton,
  IonIcon,
  IonSelect,IonSelectOption,
  IonThumbnail,
 } from '@ionic/vue';

import { defineComponent } from 'vue';

import { ref } from "vue"

// for alert 
import { alertController } from '@ionic/vue';

// for icons
/*
import { 
  cameraOutline,
 } from 'ionicons/icons';
*/

// for axios
import axios from 'axios';
const getConfig = { headers: {'access-control-allow-origin': '*'}}
const postConfig = { headers: {'access-control-allow-origin': '*',
  'content-type': 'application/json'
  }
}
// buffer to convert binary images
import {Buffer} from "buffer"

// storage
import { Storage } from '@ionic/storage';


export default defineComponent({
  name: 'HomePage',
  components: {
    IonContent,
    IonHeader,
    IonPage,
    //IonTitle,
    //IonToolbar,
    IonFooter,
    IonImg,
    IonText,
    IonCard, IonCardTitle, IonCardSubtitle, IonCardHeader, IonCardContent, 
    IonItem, 
    IonCheckbox,
    IonRange,
    IonLabel,
    IonGrid, IonRow, IonCol,
    IonButton,
    IonAccordion,IonAccordionGroup,
    IonSegment, IonSegmentButton,
    IonIcon,IonThumbnail,
    IonSelect,IonSelectOption,

  },
  computed: {
    performance() {
      let p = ""
      if (this.co2total == this.co2baseline) {
          p =  " genau gleich"
      } else 
        if (this.co2total < this.co2baseline) {
          p =  "um " + String(Math.round((1 - this.co2total / this.co2baseline) * 10000) / 100)  + "% besser"
        } else {
          p = " um " + String(Math.round((this.co2total / this.co2baseline - 1) * 10000) / 100)  + "% schlechter"
        }
      return p
    }
  },
   methods: {
    async presentAlert(e: any, hdr = "Warning", title = "", msg = "") {
      const alert = await alertController
        .create({
          cssClass: 'my-custom-class',
          header: hdr,
          subHeader: title,
          message: msg,
          buttons: ['OK'],
        });
      await alert.present();

      const { role } = await alert.onDidDismiss();
      console.log('onDidDismiss resolved with role', role);
    },
    /*
    chkUpdate(e: any, name: string) {
      console.log("Name:",name)
      console.log("Value:",e.detail.checked)
      this.chk.isChecked = e.detail.checked
      if (e.detail.checked)
        this.form[0].isChecked = false

    },
    */
    districtChanged(ev: CustomEvent) {
      console.log("District changed ",ev.detail.value)
      this.district = ev.detail.value || ""
    },
    segmentChanged(ev: CustomEvent, name = "s0") {
      console.log('Segment changed', ev,name);
      console.log("Active:",ev.detail.value)
      if (name == "s1") {
        switch (ev.detail.value) {
          case "besser": 
            this.sect1.size = 25
          break;
          case "schlechter":
            this.sect1.size = 75
          break;
          default:
            this.sect1.size = 50
          break; 
        }
      }
      if (name == "s2") {
        switch (ev.detail.value) {
          case "besser": 
            this.sect2.nocar = true
            this.sect2.freqfly = false
          break;
          case "schlechter":
            this.sect2.nocar = false
            this.sect2.freqfly = true
          break;
          default:
            this.sect2.nocar = false
            this.sect2.freqfly = false
          break; 
        }
      }
      if (name == "s3") {
        switch (ev.detail.value) {
          case "besser": 
            this.sect3.nomeat = true
            this.sect3.muchmeat = false
          break;
          case "schlechter":
            this.sect3.nomeat = false
            this.sect3.muchmeat = true
          break;
          default:
            this.sect3.nomeat = false
            this.sect3.muchmeat = false
          break; 
        }
      }
      if (name == "s4") {
        switch (ev.detail.value) {
          case "besser": 
            this.sect4.nomoney = true
            this.sect4.muchmoney = false
          break;
          case "schlechter":
            this.sect4.nomoney = false
            this.sect4.muchmoney = true
          break;
          default:
            this.sect4.nomoney = false
            this.sect4.muchmoney = false
          break; 
        }
      }
      ///
      this.computeCo2()
    },
    async submit() {
      var msg = ""
      var district = {name:"", idx: "0"}
      if (!this.district || (this.district == "0")) {
        msg += "Kein Stadtteil"
        await this.presentAlert(null,"Achtung!", "Bitte den Stadtteil auswählen")
        return
      } else {
        const d = this.districts.find((x:any) => {return x.idx == this.district})
        if (d) {
          district = d
        }
        msg += "Stadtteil: " + district.name
      }
      // check store. we will supply this at the end
      var store
      var code = null
      var id = null
      try {
        store = new Storage();
        await store.create();
        code = await store.get('code') || "";
        id = await store.get('id') || "";
        console.log("Read code:",code,", id:",id)
        msg += " Code: " + code
      } catch (e: any) {
          console.log("Reading store failed:",e.message)
      }
      // upload. Urls are default and localhost
      const urls = ["/rest.php","http://localhost:9000/rest.php"]
      var submitted = false
      var netMsg
      for (let url in urls) {
        console.log(urls[url])
        netMsg = ""
        try {
            const data:any = {}
            data.msg = "CO2App"
            if (code) data.code = code
            // id, can be blank
            if (id) data.id = id
            //data.co2total = this.co2total
            data.co2parms = this.co2parms
            data.location = {district:district.name,mult:this.mult}
            const r = await axios.request({"method":"post","url":urls[url],
              "headers":postConfig.headers,
              "data":JSON.stringify(data)
              }
            )
            console.log("Status",r.status)
            if (r.status == 200) {
              const result = await r.data
              console.log("Axios result",result)
              const xid = result.id || ""
              if (store) {
                if ((xid > "") && (result.status == 1)) {
                  console.log("Set id")
                  await store.set('id',xid)
                } else {
                  console.log("Clr id")
                  await store.remove('id')
                } 
              }
              netMsg += ", Axios OK, new id: " + xid
          } else {
              console.log("Axios failed")
              netMsg += ", Axios failed"
          }
          submitted = true
        } catch (e: any) {
          console.log("Error:",e.message)
          if (e.response.status == 403) {
            netMsg += ", Ungültiger Code"
            submitted = true
          } else {
            netMsg += ", Network Error"
          }
        }
        if (submitted) {
          await this.presentAlert(null,"Abgeschickt!", "Danke fürs Mitmachen")
          console.log(msg)
          break
        } else {
          await this.presentAlert(null, "Problem", "Kein Erfolg weil: ", msg + netMsg)
        }
      }

    },
    computeCo2() {
      console.log("Compute footprint")
      // housing
      const ha = this.sect1.renew ? .00418 : .0418
      const hb = this.sect1.eco ? .2 : .745
      const h = this.sect1.size * ha + hb 
      this.co2parms.sector1 = {value:h,parms:this.sect1}

      // mobility
      var m = 2.16
      if (this.sect2.nocar) m -= 1.5 
      if (this.sect2.freqfly) m += 3 
      this.co2parms.sector2 = {value:m,parms: this.sect2}
      // food
      var f = 1.69
      if (this.sect3.nomeat) f -= .5
      if (this.sect3.muchmeat) f += .5
      this.co2parms.sector3 = {value:f,parms:this.sect3}
      // consumption
      var cbudget = 2000
      var coffs = .95
      if (this.sect4.nomoney) {
        cbudget = 1000
        coffs = .7
      }
      if (this.sect4.muchmoney) {
        cbudget = 4500
        coffs = 1.66
      }
      if (this.sect4.stock) {
        coffs -= .7
      }
      const c = 1.25 * cbudget/1000 + coffs
      this.co2parms.sector4 = {value:c,parms:this.sect4}
      // public
      const p = .84
      this.co2parms.sector5 = {value:p,parms:{}}
      // total
      const co2 = h + m + c + f + p
      // finally round
      this.co2total = Math.round(co2 * 100) / 100
    },
   },
    watch: {
      sect1: {
        handler(newVal,oldVal) {
          console.log("Watch",newVal,oldVal)
          this.computeCo2()
        },
          deep: true
        },
      sect4: {
        handler(newVal,oldVal) {
          console.log("Watch",newVal,oldVal)
          this.computeCo2()
        },
          deep: true
        },
      },
   data() {
      return {
        co2total: 0,
        co2parms: {sector1:{},sector2:{},sector3:{},sector4:{},sector5:{}},
        /*
        chk: {val: "Chk", isChecked: true },
        form: [
          { val: 'Check1', isChecked: false },
          { val: 'Check2', isChecked: false },
          { val: 'Check3', isChecked: false },
        ],
        */
      }
   },
   async beforeMount() {
     console.log("Before Mount")
     // check query parm
     console.log("Query:",this.$route.query)
     // call like: http://localhost:8100/home?id=2
     // returns object {id:"2"}
      try {
        const store = new Storage();
        await store.create();
        if ((this.$route.query.code || "") > "") {
          const code = this.$route.query.code
          console.log("Setting code",code)
          await store.set('code', code);
        } else {
          console.log("No code")
          await store.remove("code");
        }
      } catch (e: any) {
          console.log("Store failed:",e.message)
      }

     // ---------------------------
     // load json
     var url = "/data/districts.json"
     try {
        const r = await axios.get(url,getConfig)
        console.log("Status",r.status)
        if (r.status == 200) {
          const data = await r.data
          console.log("Data loaded",data)
          const d: any = []
          data.forEach((x:string,i:number) => {
            d.push({name:x,idx:(i+1).toString()})
          })
          this.districts = d.sort((a:any,b:any)=>{return a.name > b.name})
          //this.districts = data
          console.log(this.districts)

          this.districtsLoaded = true
      } else {
          console.log("failed")
      }
     } catch (e: any) {
       console.log("Error:",e.message)
     }
     // ---------------------------
     // load binary image
     url = "https://vp2.akugel.de/images/img.png"
     try {
       // for binary images we need to set the content type to
       // arraybuffer, which doesn't work in Typescript with
       // AxiosRequestConfig
       // use request with explicit params
        const r = await axios.request({"method":"get","url":url,
          "headers":getConfig.headers,
          "responseType":"arraybuffer",
          }
        )
        //const r = await axios.get(url,pngConfig)
        console.log("Status",r.status)
        if (r.status == 200) {
          const testImg = await r.data
          console.log("Img loaded")
          //this.presentAlert(null,"Image loaded")
          var prefix = "data:" + r.headers["content-type"] + ";base64,";
          var img = await Buffer.from(testImg,'binary').toString("base64");
          //console.log("Img:",img.length)
          var dataUri = prefix + img;
          //console.log("img:",dataUri)
          this.axImg = dataUri
      } else {
          console.log("failed")
          this.presentAlert(null,"","Loading image failed")
      }
     } catch (e: any) {
       console.log("Error:",e.message)
       this.presentAlert(null,"",e.message)
     }
     // update footprint
     this.computeCo2()
   },
   setup() {
    const co2baseline = 10.98
    const sect1 = ref({size:50,renew:false,eco:false})
    const sect2 = ref({nocar: false,freqfly: false})
    const sect3 = ref({nomeat:false, muchmeat:false})
    const sect4 = ref({nomoney:false,muchmoney:false,stock:false})
    const axImg = ref("")
    const district = ref("0")
    const districts = ref([])
    const districtsLoaded = ref(false)
    const districtOptions = ref()
    const mult = ref(0)
    return { co2baseline, sect1, sect2, sect3, sect4, mult, axImg, district, districts, districtsLoaded }
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


.logo {
  /*height: 3rem;*/
  padding-right: .2rem;
  object-position: left;
  max-width: 35%;
}

.logo > img {
  max-width: 95%;
}


.headline-container {
  --inner-border-width: 0;
  margin: 1rem;
}

.headline {
  font-size: 2rem;
  font-weight: bold;
  margin-bottom: -.4rem;
  white-space: break-spaces;
}

ion-thumbnail {
  width: unset;
  height: unset;
}

.appdesign {
  height: 3rem;
  /*
  width: 100%;
  padding: 0;
  object-position: left;
  */
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
@media only screen and (max-width: 599px) {
ion-item {
  --padding-start: 5px;
  }
  .headline {
    font-size: 1.3rem;
    margin-bottom: .2rem;
  }
}

/* smaller padding on small screen */
@media only screen and (max-width: 399px) {
  .headline {
    font-size: 1.1rem;
    margin-bottom: .5rem;
  }
}



/* smaller padding on small screen */
/*
@media only screen and (max-width: 480px) {
ion-item {
  --padding-start: 5px;
  }
  .logo {
    height: 1.5rem;
  }
  .headline {
    font-size: 1.3rem;
  }
}
*/

/* make main content transparent */
ion-content.onepnt5 { --background: transparent;}
/* and set background image */
.onepnt5 {
  background: unset;
  background-image: url("../../public/assets/img/onePointFive.jpg");
  background-size: cover;
  background-position: center;
}

.totalco2 {
  padding: .5rem;
  text-align: center;
  background: lightblue;
}
</style>
