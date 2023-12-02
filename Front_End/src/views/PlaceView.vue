<script setup>
import { toRaw, ref, reactive, onMounted } from "vue"
import { useSocialStore } from "@/stores/SocialStores"
import dateformat from '@/common/dateformat'
import http from '@/common/axios'

// getBoardListData
const getBoardList = async () => {
  let params = {
    leftLatitude: 34,
    rightLatitude: 36,
    leftLongitude: 120,
    rightLongitude: 130
  }
  try {
    // params: params shorthand property, let response 도 제거

    let { data } = await http.get("/attractions", { params });
    console.log("boardStore: data : ");
    // console.log(data);
    return data
  } catch (error) {
    console.error(error);
  }
  return null
}






// 카카오 앱키
const appkey = import.meta.env.VITE_APP_KAKAO_KEY;

// 데이터
const markers = ref([])
const infowindow = ref()
let map = null;
const contentList2 = ref([])
const customOverlay2 = ref([])
const customOverlay2Map2 = new Map();

// 서버에서 받아올 데이터 구조




// 선수행 코드
onMounted(() => {
  console.log("onMounted()")
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
})




// 아래에는 카카오객체를 제어하는 "함수"들이 존재합니다. (함수만 실행 가능)

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
  setData(await getBoardList())
  createOverlayContent()
}

// 사이즈 변경 함수 (안씀)
const changeSize = (size) => {
  console.log("changeSize()")
  const container = document.getElementById("map");
  container.style.width = `${size}px`;
  container.style.height = `${size}px`;
  toRaw(map).relayout();
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

// 윈도우 띄움 (안씀)
const displayInfoWindow = () => {
  if (infowindow.value && infowindow.value.getMap()) {
    // 이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
    toRaw(map).setCenter(infowindow.value.getPosition());
    return;
  }

  var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

  infowindow.value = new kakao.maps.InfoWindow({
    map: toRaw(map), // 인포윈도우가 표시될 지도
    position: iwPosition,
    content: iwContent,
    removable: iwRemoveable,
  });

  toRaw(map).setCenter(iwPosition);
}



// data 설정
const setData = (data) => {
  console.log(data)
  data.forEach((el) => {
    // console.dir(el)
    contentList2.value.push({
      contentId: el.contentId,
      username: null,
      title: el.title,
      latlng: new kakao.maps.LatLng(el.latitude, el.longitude),
      image: el.firstImage == "" ? '/img/noimage.png' : el.firstImage,
      date: new Date('2023-11-22 01:50:30')
    })
  })
}

// 오버레이 콘텐츠 생성
const createOverlayContent = () => {
  for (var i = 0; i < contentList2.value.length; i++) {
    var contentId = contentList2.value[i].contentId
    var username = contentList2.value[i].username
    var title = contentList2.value[i].title
    var latlng = contentList2.value[i].latlng
    var image = contentList2.value[i].image
    var date = formatDate(contentList2.value[i].date)

    // 커스텀 오버레이를 생성합니다
    customOverlay2.value[i] = new kakao.maps.CustomOverlay({
      position: contentList2.value[i].latlng,
      content:
        `
        <div class="minicard" id="minicard${contentId}" data-contentid="${contentId}"> 
          
          <div class="cardinfo-minicard"> 
            <div class="userinfo-minicard d-flex justify-content-start">      
              <img class="mini-profile-image" src="/img/noprofile-minicard.png"></img> 
              <div class="username-minicard my-auto"">
                ${username}
              </div> 
            </div> 
            
            <img  mg class="card-content-image" src="${image}"></img> 
          
            <div class="title-minicard">
              <div class="date-minicard">${date}</div>
              ${title}${i}
            </div> 
          </div> 

        </div> 
        `,
      xAnchor: 0.3,
      yAnchor: 0.91
    });

    // 각 overlay 객체 접근을 위해 key를 contentId로 가지는 Map에 저장
    customOverlay2Map2.set(contentId, customOverlay2.value[i])

    // z index 설정 방법
    customOverlay2.value[i].setMap(map);
  }


  // 이벤트 등록 : 화면에 나타나는 콘텐츠에만 이벤트를 등록할 수 있으므로 따로 함수로 구현해야 한다.
  for (var i = 0; i < contentList2.value.length; i++) {
    var contentId = contentList2.value[i].contentId
    const htmldocument = document.querySelector(`#minicard${contentId}`);
    htmldocument.addEventListener('click', function () {
      getcontentId(this.dataset['contentid']);
    });
    htmldocument.addEventListener('mouseenter', function () {
      setAddZIndex(htmldocument);
      const contentId = Number(this.dataset['contentid'])
      console.log('mouseenter ', contentId)
      const overlay = customOverlay2Map2.get(contentId)
      overlay.setZIndex(1000)
      overlay.setMap(map);

    });
    htmldocument.addEventListener('mouseleave', function () {
      setDeleteZIndex(htmldocument);
      const contentId = this.dataset['contentid']
      console.log('mouseleave ', contentId)
      const overlay = customOverlay2Map2.get(contentId)
    });
  }


}
// 게시물 ID 가져오기 TEST
const getcontentId = (contentId) => console.log(`contentId를 가져옵니다 : ${contentId}`);
const setAddZIndex = (htmldocument) => htmldocument.classList.add('z-index')
const setDeleteZIndex = (htmldocument) => htmldocument.classList.remove('z-index')
// 



// 날짜형식 변환 함수
const formatDate = (date) => {
  return dateformat.formatDate(new Date(date));
}
</script>

<template>
  <section class="w-100 h-100">
    <div class="w-100 h-100" id="map"></div>

  </section>
  <div class="navbarSpace"></div>
</template>

<style>
/* mini card CSS */
.minicard {
  position: relative;
  width: 140px;
  height: 140px;
  padding: 5px;
}

.minicard:hover {
  filter: brightness(90%)
}

.minicard:hover .userinfo-minicard {
  top: 0;
  opacity: 1;
}

.minicard:hover .title-minicard {
  bottom: 0;
  opacity: 1;
}



/* 사용자 정보 */
.userinfo-minicard {
  position: absolute;
  height: 20px;
  width: 100%;
  padding: 10px;
  /* background: linear-gradient(rgba(85, 85, 85, 0.5), rgba(133, 133, 133, 0) 80%); */
  /* visible animation */
  top: -1em;
  opacity: 0;
  transition: opacity 0.2s, top 0.2s;
}

/* 사진 위 미니 프로필 사진 */
img.mini-profile-image {
  border-radius: 50%;
  height: 20px;
  width: 20px;
  margin-right: 5px;
  object-fit: cover;
}

/* 사진 위 글자 (사용자 이름) */
.username-minicard {
  color: #ffffff;
  font-size: 12px;
  font-weight: bold;
  overflow: hidden;
}


/* 작성날짜 */
.date-minicard {
  font-weight: normal;
  display: flex;
  justify-content: start;
  color: #c7c7c7;
  font-size: 10px;
  bottom: 26px;
  position: absolute;
  width: 100%;
  padding-right: 10px;
}


/* 카드 콘텐츠 이미지 */
img.card-content-image {
  width: 130px;
  height: 130px;
  object-fit: cover;
  border-radius: 1rem;
}

.cardinfo-minicard {
  position: relative;
  border-radius: 1rem;
  overflow: hidden;
  box-shadow: 1px 1px 3px #575757;
}

.cardinfo-minicard:hover {
  box-shadow: 1px 1px 5px #4d4d4d;
}

.cardinfo-minicard .title-minicard {
  position: absolute;
  color: #fff;
  font-weight: bold;
  width: 100%;
  bottom: 0;
  background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.5) 90%);
  padding: 10px 10px;
  font-size: 14px;
  /* visible animation */
  bottom: -1em;
  opacity: 0;
  transition: opacity 0.2s, bottom 0.2s;
}
</style>


<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
section {
  position: fixed;
  background-color: rgb(50, 50, 50);
  padding-top: 70px;
}

@media (min-width: 992px) {
  section {
    padding-top: 60px;
  }
}

/* Navbar 뒤에빈공간 생성 */
.navbarSpace {
  width: 100%;
  height: 70px;
}

@media (min-width: 992px) {
  .navbarSpace {
    height: 60px;
  }
}




.button-group {
  margin: 10px 0px;
}

button {
  margin: 0 3px;
}
</style>
