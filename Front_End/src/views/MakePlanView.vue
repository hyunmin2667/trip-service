<script setup>
import { toRaw, ref, reactive, onMounted, computed, watch } from "vue"
import { useSocialStore } from "@/stores/SocialStores"
import dateformat from '@/common/dateformat'
import Sortable from 'sortablejs';
import http from '@/common/axios'

// 선수행 코드
onMounted(() => {
  // 카카오
  if (window.kakao && window.kakao.maps) {
    // kakao 객체가 이미 생성되어 있음
    initMap();
  } else {
    const script = document.createElement("script");
    /* global kakao */
    script.onload = () => kakao.maps.load(initMap); // script 로딩 후 객체
    script.src = `//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=${appkey}`;
    document.head.appendChild(script);
    console.log("appendChild(script)")
  }

  // sortable 라이브러리
  const columns = document.querySelectorAll(".column");
  columns.forEach((column) => {
    new Sortable(column, {
      group: "shared",
      animation: 150,
      ghostClass: "blue-background-class"
    });
  });
})

// 카카오
const appkey = import.meta.env.VITE_APP_KAKAO_KEY;
let map = null;

const attractionList = ref([])
const dayList = ref([])
const markerPositions = ref([])

const regionSearchKeyword = ref("")
const selectedRegion = ref("")
const searchResultList = ref([])
const searchResultCnt = computed(searchResultList.value.length)
const searchResultIsZero = computed(searchResultCnt == 0)
const searchResultHide = ref(false)

const attractionFilter = reactive({
  startDate: '',
  endDate: '',
  sidoCode: 0,
  gugunCode: 0,
  planTitle: '',
  leftLatitude: 34,
  rightLatitude: 36,
  leftLongitude: 120,
  rightLongitude: 130
})



const setRegion = (result) => {
  regionSearchKeyword.value = result.regionName
  attractionFilter.sidoCode = result.sidoCode
  attractionFilter.gugunCode = result.gugunCode
  searchResultHide.value = true
  initMap()
}

// 지역검색을 통해 sido,gugun을 구하는 함수
const searchRegion = async (searchKeyword) => {
  if (regionSearchKeyword.value == "") return
  searchResultHide.value = false
  try {
    let { data } = await http.get(`/region/${searchKeyword}`)
    // console.log("boardStore: data : ")
    // console.log(data);
    searchResultList.value = data
  } catch (error) {
    console.error(error)
  }
}



// 맵을 생성하는 함수
const initMap = async () => {
  const container = document.getElementById("map");
  const options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 14,
  };

  //지도 객체를 등록합니다.
  //지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
  map = new kakao.maps.Map(container, options);
  console.log("initMap() : create kakao map")
  setAttractionList(await getAttraction())
}

// 관광지 데이터 얻어오기
const getAttraction = async () => {
  
  
  
  
  
  let params = {
    leftLatitude: attractionFilter.leftLatitude,
    rightLatitude: attractionFilter.rightLatitude,
    leftLongitude: attractionFilter.leftLongitude,
    rightLongitude: attractionFilter.rightLongitude,
    sidoCode: attractionFilter.sidoCode,
    gugunCode: attractionFilter.gugunCode
  }
  console.log(params)
  try {
    // params: params shorthand property, let response 도 제거

    let { data } = await http.get("/attractions", { params })
    console.log("boardStore: data : ")
    console.log(data);
    return data
  } catch (error) {
    console.error(error)
  }
  return null
}



// 데이터
const setAttractionList = (data) => {
  // console.log(data)
  attractionList.value = []
  data.forEach((el) => {
    // console.dir(el)
    attractionList.value.push({
      contentId: el.contentId,
      title: el.title,
      image: el.firstImage == "" ? '/img/noimage.png' : el.firstImage,
      date: new Date('2023-11-22 01:50:30')
    })
    // console.log(attractionList.value)
  })
}

// 마커 좌표리스트를 읽어 화면에 뿌려주는 함수 (안씀)
const displayMarker = (markerPositions) => {
  console.log("displayMarker()");
  if (markers.value.length > 0) {
    markers.value.forEach((marker) => marker.setMap(null));
  }

  const positions = markerPositions.map(
    (position) => new kakao.maps.LatLng(...position)
  );

  if (positions.length > 0) {
    markers.value = positions.map(
      (position) =>
        new kakao.maps.Marker({
          map: toRaw(map),
          position,
        })
    );

    const bounds = positions.reduce(
      (bounds, latlng) => bounds.extend(latlng),
      new kakao.maps.LatLngBounds()
    );

    toRaw(map).setBounds(bounds);
  }
}

</script>


<template>
  <!-- 페이지 정보 -->
  <section class="w-100 h-100">
    <div class=" d-flex h-100 flex-row-reverse drag-and-drop-Box ">
      <!-- Drag & Drop Start -->
      <div class="h-100 column right">
        관광지 리스트
        <div v-for="attractionInfo in attractionList" :key="attractionInfo.contentId" class="w-100 draggable item"
          draggable="true" @click="console.log(attractionInfo.contentId)">
          <div class="article-card">
            <div class="content">
              <p class="date">{{ attractionInfo.myFavorite }}</p>
              <p class="title">{{ attractionInfo.title }}</p>
            </div>
            <img :src="attractionInfo.firstImage == '' ? '/img/noimage.png' : attractionInfo.image" alt="article-cover" />
          </div>
        </div>
      </div>

      <div class="h-100 left">
        <div class="column w-100 cur-day">
          1일차
        </div>
        <div class="column w-100 cur-day">
          2일차
        </div>
        <div class="column w-100 cur-day">
          3일차
        </div>
        <div class="column w-100 cur-day">
          4일차
        </div>
        <div class="column w-100 cur-day">
          5일차
        </div>
      </div>
      <!-- Drag & Drop End -->

      <div class="map-space">
        <!-- 지도 시작 -->
        <div class="w-100 h-100" id="map"></div>
        <!-- 지도 종료 -->

        <!-- 검색 start -->
        <div class="searchSpace">
          <!-- 검색창 -->
          <div class="search mx-auto">
            <input @keyup="searchRegion(regionSearchKeyword)" v-model="regionSearchKeyword" type="text" autocomplete="off"
              required />
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="-20 -20 1000 150">
              <path class="path" fill="none"
                d="M924.4 85.2c-19.5 19.5-50.8 19.7-70.3 0-19.3-19.4-19.3-51 .3-70.6 19.5-19.5 51-19.4 70.6 0 19.3 19.7 19.3 50.8-.5 70.6l35.4 35.3H0" />
            </svg>
          </div>
          <!-- 검색결과 -->
          <div class="search-result-list mx-auto" v-show="!searchResultHide">
            <div v-for="(result, index) in searchResultList" :key="index" class="search-result mx-auto"
              @click="setRegion(result)">
              {{ result.regionName }}
            </div>
          </div>
        </div>
        <!-- 검색 End -->
      </div>

    </div>


    <!-- <button>완료</button> -->
  </section>
</template>



<style scoped>
/* 검색 결과 */

.search-result-list::-webkit-scrollbar {
  display: none;
  /* 크롬, 사파리, 오페라, 엣지 */
}

.search-result-list {
  padding-top: 100px;
  height: 100%;
  overflow: auto;
}

.search-result {
  padding: 0 10px;
  background-color: #ececec;
  z-index: 100;
  height: 50px;
  width: 300px;
  overflow: auto;
}

.search-result:hover {
  cursor: pointer;
}

#result-item {
  height: 100px;
  width: 250px;
  overflow: auto;
  /* 스크롤바 추가 */
}



.map-space {
  position: relative;
  width: 60%;
  height: 100%;
  border-radius: 8px;
  overflow: hidden;
}

/* 검색 */
.searchSpace {
  position: absolute;
  top: 5%;
  width: 100%;
  height: 95%;
  z-index: 1;
}

.search {
  position: absolute;
  width: 300px;
  height: 50px;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow: hidden;
}

.search svg {
  width: 300px;
  transform: translate3d(-125px, 0, 0);
  transition: .5s;
  pointer-events: none;
}

.search input {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: transparent;
  border: none;
  color: #f4623a;
  font-size: 1.5rem;
  padding: 10px 55px 10px 10px;
  box-sizing: border-box;
  cursor: pointer;
}

.search input::selection {
  background: rgba(0, 0, 0, 0.3);
}

.search input:valid,
.search input:focus {
  cursor: auto;
}

.search input:valid+svg,
.search input:focus+svg {
  transform: translate3d(0, 0, 0);
}

.search input:focus {
  cursor: auto;
  outline: none;
}

.search input:focus+svg .path {
  stroke-dasharray: 961, 363;
  stroke-dashoffset: -363;
}

.search .path {
  stroke-dasharray: 363, 961;
  stroke-dashoffset: 0;
  stroke: #f4623a;
  stroke-width: 10;
  stroke-linejoin: round;
  stroke-linecap: round;
  transition: .5s;
}













section {
  background-color: rgb(50, 50, 50);
  padding-top: 70px;
}

@media (min-width: 992px) {
  section {
    padding-top: 60px;
  }
}

.article-card {
  margin: 10px;
  height: 100px;
  border-radius: 12px;
  overflow: hidden;
  position: relative;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
}

.article-card:hover {
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
}

.article-card img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.article-card .content {
  box-sizing: border-box;
  width: 100%;
  position: absolute;
  padding: 30px 20px 20px 20px;
  height: auto;
  bottom: 0;
  background: linear-gradient(transparent, rgba(0, 0, 0, 0.6));
}

.article-card .date,
.article-card .title {
  margin: 0;
}

.article-card .date {
  font-size: 12px;
  color: rgba(255, 255, 255, 0.9);
  margin-bottom: 4px;
}

.article-card .title {
  font-size: 14px;
  color: #ececec;
}


button {
  width: 70px;
  height: 70px;
  border: none;
  border-radius: 8px;
  margin: 12px;
  cursor: move;
  font-size: 30px;
  background: #eaeaea4f;
}


.right {
  text-align: center;
  font-size: 20px;
  font-weight: 600;
  width: 20%;
  margin: 0 5px;
  padding: 10px;
  background-color: #b5c1dc57;
  border-radius: 8px;

  /* 스크롤이 끝났을 때 화면전체가 스크롤되지 않게 한다. */
  overflow-y: scroll;
  -ms-overflow-style: none;
  /* 인터넷 익스플로러 */
  scrollbar-width: none;
  /* 파이어폭스 */
  overscroll-behavior: none;
}

.left {
  width: 20%;
  margin: 0 5px;
  padding: 10px;
  background-color: #b5c1dc57;
  border-radius: 8px;

  overflow-y: scroll;
  -ms-overflow-style: none;
  /* 인터넷 익스플로러 */
  scrollbar-width: none;
  /* 파이어폭스 */
  overscroll-behavior: none;
}

.cur-day {
  text-align: center;
  font-size: 20px;
  font-weight: 600;
  margin-bottom: 10px;
  min-height: 30%;
  padding: 10px;
  background-color: #b5c1dc57;
  border-radius: 8px;
}

.right::-webkit-scrollbar {
  display: none;
  /* 크롬, 사파리, 오페라, 엣지 */
}

.left::-webkit-scrollbar {
  display: none;
  /* 크롬, 사파리, 오페라, 엣지 */
}

c .draggable.dragging {
  opacity: 0.5;
}



/* Navbar 뒤에빈공간 생성 */
.navbarSpace {
  background-color: rgb(50, 50, 50);
  width: 100%;
  height: 70px;
}

@media (min-width: 992px) {
  .navbarSpace {
    height: 60px;
  }
}
</style>