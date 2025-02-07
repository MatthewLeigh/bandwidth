"use strict";(self["webpackChunkbandwidth_v3"]=self["webpackChunkbandwidth_v3"]||[]).push([[641],{2150:function(e,s,t){t.d(s,{A:function(){return c}});var a=t(6768);const i={class:"card-grid-wrapper"};function r(e,s,t,r,u,n){const o=(0,a.g2)("FocusCard");return(0,a.uX)(),(0,a.CE)("div",i,[((0,a.uX)(!0),(0,a.CE)(a.FK,null,(0,a.pI)(e.focusList,(e=>((0,a.uX)(),(0,a.Wv)(o,{key:e.id,focus:e},null,8,["focus"])))),128))])}var u=t(3692),n=(0,a.pM)({name:"FocusCardGrid",components:{FocusCard:u.A},props:{focusList:{type:Array,required:!0}}}),o=t(1241);const l=(0,o.A)(n,[["render",r],["__scopeId","data-v-1af421f5"]]);var c=l},6641:function(e,s,t){t.r(s),t.d(s,{default:function(){return D}});var a=t(6768),i=t(4232),r=t(3892),u=t(3813),n=t(9669),o=t(5126);const l=["src"],c={class:"banner-content"},v={class:"img-wrapper"},d={class:"user-name"},f={class:"user-location"},w={class:"tally-row"},k={class:"tally"},p={class:"tally-count"},L={class:"tally"},y={class:"tally-count"},m={class:"tally"},g={class:"tally-count"},h={class:"bar-wrapper mt-15"},E={class:"bar-wrapper mt-15"},b={class:"bar-wrapper mt-15"},F={class:"bar-wrapper mt-15"};function W(e,s,W,V,R,_){const A=(0,a.g2)("DividerBar"),X=(0,a.g2)("FocusCardRow"),C=(0,a.g2)("FocusCardGrid"),I=(0,a.g2)("RandomBanner");return(0,a.uX)(),(0,a.Wv)(u.I,null,{default:(0,a.k6)((()=>[(0,a.bF)(u.I,{class:"banner-wrapper"},{default:(0,a.k6)((()=>[(0,a.Lk)("img",{class:"banner-background",src:t(133),alt:"Profile Banner Background"},null,8,l),(0,a.Lk)("div",c,[(0,a.Lk)("div",v,[e.userImg?((0,a.uX)(),(0,a.Wv)(o.y,{key:0,src:e.userImg,alt:"User Image",cover:"",class:"user-img"},null,8,["src"])):(0,a.Q3)("",!0)]),(0,a.Lk)("p",d,(0,i.v_)(e.userFirstName)+" "+(0,i.v_)(e.userLastName),1),(0,a.Lk)("p",f,(0,i.v_)(e.userCountry)+", "+(0,i.v_)(e.userState),1),(0,a.Lk)("div",w,[(0,a.Lk)("div",k,[(0,a.Lk)("p",p,(0,i.v_)(e.savedEvents.length),1),s[5]||(s[5]=(0,a.Lk)("p",{class:"tally-label"},"Saved Events",-1))]),s[8]||(s[8]=(0,a.Lk)("div",{class:"spacer"},null,-1)),(0,a.Lk)("div",L,[(0,a.Lk)("p",y,(0,i.v_)(e.favouriteArtists.length),1),s[6]||(s[6]=(0,a.Lk)("p",{class:"tally-label"},"Favourite Artists",-1))]),s[9]||(s[9]=(0,a.Lk)("div",{class:"spacer"},null,-1)),(0,a.Lk)("div",m,[(0,a.Lk)("p",g,(0,i.v_)(e.favouriteVenues.length),1),s[7]||(s[7]=(0,a.Lk)("p",{class:"tally-label"},"Favourite Venues",-1))])]),(0,a.bF)(r.D,{class:"logout-button",onClick:s[0]||(s[0]=s=>e.handleLogout()),flat:""},{default:(0,a.k6)((()=>[(0,a.bF)(n.w,{icon:"mdi-logout"}),s[10]||(s[10]=(0,a.Lk)("span",null,"Sign Out",-1))])),_:1})])])),_:1}),(0,a.Lk)("div",h,[(0,a.bF)(A,{text:"Saved events"}),(0,a.Lk)("div",{class:"icon-wrapper",onClick:s[1]||(s[1]=s=>e.isRow.savedEvents=!e.isRow.savedEvents)},[e.isRow.savedEvents?((0,a.uX)(),(0,a.Wv)(n.w,{key:0},{default:(0,a.k6)((()=>s[11]||(s[11]=[(0,a.eW)("mdi-dots-horizontal")]))),_:1})):((0,a.uX)(),(0,a.Wv)(n.w,{key:1},{default:(0,a.k6)((()=>s[12]||(s[12]=[(0,a.eW)("mdi-dots-grid")]))),_:1}))])]),e.isRow.savedEvents?((0,a.uX)(),(0,a.Wv)(X,{key:0,focusList:e.savedEvents,title:"Saved Events"},null,8,["focusList"])):((0,a.uX)(),(0,a.Wv)(C,{key:1,focusList:e.savedEvents,title:"Saved Events"},null,8,["focusList"])),(0,a.Lk)("div",E,[(0,a.bF)(A,{text:"Recently viewed events"}),(0,a.Lk)("div",{class:"icon-wrapper",onClick:s[2]||(s[2]=s=>e.isRow.recentlyViewedEvents=!e.isRow.recentlyViewedEvents)},[e.isRow.recentlyViewedEvents?((0,a.uX)(),(0,a.Wv)(n.w,{key:0},{default:(0,a.k6)((()=>s[13]||(s[13]=[(0,a.eW)("mdi-dots-horizontal")]))),_:1})):((0,a.uX)(),(0,a.Wv)(n.w,{key:1},{default:(0,a.k6)((()=>s[14]||(s[14]=[(0,a.eW)("mdi-dots-grid")]))),_:1}))])]),e.isRow.recentlyViewedEvents?((0,a.uX)(),(0,a.Wv)(X,{key:2,focusList:e.recentlyViewedEvents,title:"Recently Viewed Events"},null,8,["focusList"])):((0,a.uX)(),(0,a.Wv)(C,{key:3,focusList:e.recentlyViewedEvents,title:"Recently Viewed Events"},null,8,["focusList"])),(0,a.Lk)("div",b,[(0,a.bF)(A,{text:"Favourite artists"}),(0,a.Lk)("div",{class:"icon-wrapper",onClick:s[3]||(s[3]=s=>e.isRow.favouriteArtists=!e.isRow.favouriteArtists)},[e.isRow.favouriteArtists?((0,a.uX)(),(0,a.Wv)(n.w,{key:0},{default:(0,a.k6)((()=>s[15]||(s[15]=[(0,a.eW)("mdi-dots-horizontal")]))),_:1})):((0,a.uX)(),(0,a.Wv)(n.w,{key:1},{default:(0,a.k6)((()=>s[16]||(s[16]=[(0,a.eW)("mdi-dots-grid")]))),_:1}))])]),e.isRow.favouriteArtists?((0,a.uX)(),(0,a.Wv)(X,{key:4,focusList:e.favouriteArtists,title:"Favourite Artists"},null,8,["focusList"])):((0,a.uX)(),(0,a.Wv)(C,{key:5,focusList:e.favouriteArtists,title:"Favourite Artists"},null,8,["focusList"])),(0,a.Lk)("div",F,[(0,a.bF)(A,{text:"Favourite venues"}),(0,a.Lk)("div",{class:"icon-wrapper",onClick:s[4]||(s[4]=s=>e.isRow.favouriteVenues=!e.isRow.favouriteVenues)},[e.isRow.favouriteVenues?((0,a.uX)(),(0,a.Wv)(n.w,{key:0},{default:(0,a.k6)((()=>s[17]||(s[17]=[(0,a.eW)("mdi-dots-horizontal")]))),_:1})):((0,a.uX)(),(0,a.Wv)(n.w,{key:1},{default:(0,a.k6)((()=>s[18]||(s[18]=[(0,a.eW)("mdi-dots-grid")]))),_:1}))])]),e.isRow.favouriteVenues?((0,a.uX)(),(0,a.Wv)(X,{key:6,focusList:e.favouriteVenues,title:"Favourite Venues"},null,8,["focusList"])):((0,a.uX)(),(0,a.Wv)(C,{key:7,focusList:e.favouriteVenues,title:"Favourite Venues"},null,8,["focusList"])),(0,a.bF)(I)])),_:1})}t(1454);var V=t(4312),R=t(1840),_=t(5793),A=t(6705),X=t(8766),C=t(1510),I=t(2150),S=t(657),B=t(926),$=t(5704),N=t(529),j=(0,a.pM)({name:"EventSearchView",setup(){const e=(0,B.B)(),{getUser:s}=(0,S.bP)(e),t=(0,$.e)(),{goTo:a}=(0,N.c)();return{sessionStore:e,user:s,snackbar:t,goTo:a}},components:{RandomBanner:A.A,FocusCardRow:X.A,DividerBar:C.A,FocusCardGrid:I.A},data(){return{savedEvents:[],recentlyViewedEvents:[],favouriteArtists:[],favouriteVenues:[],userImg:"",userFirstName:"",userLastName:"",userEmail:"",userCountry:"",userState:"",isRow:{savedEvents:!0,recentlyViewedEvents:!0,favouriteArtists:!0,favouriteVenues:!0}}},async mounted(){try{const e=await fetch(`${_.g}/user-details/${this.user.userId}`),s=await e.json();this.userImg=s[0].ImageURL,this.userFirstName=s[0].FirstName,this.userLastName=s[0].LastName,this.userEmail=s[0].Email,this.userCountry=s[0].Country,this.userState=s[0].State;const t=await fetch(`${_.g}/user-saved-event-ids/${this.user.userId}`),a=await t.json();this.savedEvents=a.ids.map((e=>new V.B(e,R.d.Event)));const i=await fetch(`${_.g}/user-recently-viewed-event-ids/${this.user.userId}`),r=await i.json();this.recentlyViewedEvents=r.ids.map((e=>new V.B(e,R.d.Event)));const u=await fetch(`${_.g}/user-favourite-artist-ids/${this.user.userId}`),n=await u.json();this.favouriteArtists=n.ids.map((e=>new V.B(e,R.d.Artist)));const o=await fetch(`${_.g}/user-favourite-venue-ids/${this.user.userId}`),l=await o.json();this.favouriteVenues=l.ids.map((e=>new V.B(e,R.d.Venue)))}catch(e){console.error("Error fetching data:",e)}},methods:{handleLogout(){this.sessionStore.logout(),this.snackbar.showSnackbar("Sign Out Successful."),this.goTo("home")}}}),x=t(1241);const z=(0,x.A)(j,[["render",W],["__scopeId","data-v-8cdba0c6"]]);var D=z},133:function(e,s,t){e.exports=t.p+"img/profile-banner-background.25265768.svg"}}]);
//# sourceMappingURL=641.d1365f69.js.map