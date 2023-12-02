<script setup>
// import
import { toRaw, ref, onMounted } from 'vue'
import http from '@/common/axios.js'

// 카카오 앱키
const appkey = import.meta.env.VITE_APP_KAKAO_KEY;

let map
let bounds
let markers = []
let index = 0
let itemEl = ''

const places = ref([])
const searchKeyword = ref('')
const points = ref([])
const getListItem = (index, places) => {
  var el = document.createElement('li'),
    itemStr =
      '<span class="markerbg marker_' +
      (index + 1) +
      '"></span>' +
      '<div class="info">' +
      '   <h5>' +
      places.value.spotTitle +
      '</h5>'

  if (places.value.spotAddr1) {
    itemStr += '    <span>' + places.value.spotAddr1 + '</span>'
  } else {
    itemStr += '    <span> 정보를 불러올 수 없습니다 </span>'
  }

  itemStr += '  <span class="tel">' + places.value.spotTel + '</span>' + '</div>'

  el.innerHTML = itemStr
  el.className = 'item'

  return el
}
const addMarker = (position, idx, title) => {
  var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
    imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
    imgOptions = {
      spriteSize: new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
      spriteOrigin: new kakao.maps.Point(0, idx * 46 + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
      offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
    },
    markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
    marker = new kakao.maps.Marker({
      position: position, // 마커의 위치
      image: markerImage
    })

  marker.setMap(map) // 지도 위에 마커를 표출합니다
  markers.push(marker) // 배열에 생성된 마커를 추가합니다

  return marker
}
// export default {
//   apiResponse: null,
//   loading: false,
//   name: 'KakaoMap',

// data() {
//   return {
//     searchResult: '',
// places: []
//     //   map: null
//   }
// },
// searchResult: [],
onMounted(() => {
  if (window.kakao && window.kakao.maps) {
    initMap()
  } else {
    const script = document.createElement('script')
    /* global kakao */
    script.onload = () => kakao.maps.load(initMap)
    script.src =
      `//dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=${appkey}`
    document.head.appendChild(script)
  }
})

// methods: {
const initMap = () => {
  const container = document.getElementById('map')
  const options = {
    center: new kakao.maps.LatLng(33.450701, 126.570667),
    level: 5
  }

  //지도 객체를 등록합니다.
  //지도 객체는 반응형 관리 대상이 아니므로 initMap에서 선언합니다.
  map = new kakao.maps.Map(container, options)

  var markerPositions = []
}
const changeSize = (size) => {
  const container = document.getElementById('map')
  container.style.width = `${size}px`
  container.style.height = `${size}px`
  toRaw(map).relayout()
}

const displayMarker = (markerPositions) => {
  if (markers.length > 0) {
    markers.forEach((marker) => marker.setMap(null))
  }

  const positions = markerPositions.map((position) => new kakao.maps.LatLng(...position))

  if (positions.length > 0) {
    markers = positions.map(
      (position) =>
        new kakao.maps.Marker({
          map: toRaw(map),
          position
        })
    )

    const bounds = positions.reduce(
      (bounds, latlng) => bounds.extend(latlng),
      new kakao.maps.LatLngBounds()
    )

    toRaw(map).setBounds(bounds)
  }
}
const displayInfoWindow = () => {
  if (infowindow && infowindow.getMap()) {
    //이미 생성한 인포윈도우가 있기 때문에 지도 중심좌표를 인포윈도우 좌표로 이동시킨다.
    toRaw(map).setCenter(infowindow.getPosition())
    return
  }

  var iwContent = '<div style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
    iwRemoveable = true // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

  infowindow = new kakao.maps.InfoWindow({
    map: toRaw(map), // 인포윈도우가 표시될 지도
    position: iwPosition,
    content: iwContent,
    removable: iwRemoveable
  })

  toRaw(map).setCenter(iwPosition)
}
const search = async (searchKeyword) => {
  let { data } = await http.get(`/spot/search/${searchKeyword}`)
  markers.push(data)

  //   console.log(searchKeyword)
  //   console.log(markers)

  //   searchPlaces()
}
const searchPlaces = async () => {
  if (!window.kakao || !window.kakao.maps) {
    alert('Kakao Map API가 아직 로드되지 않았습니다.')
    return
  }
  var ps = new kakao.maps.services.Places()
  // TODO 여기서 DB와 연동해서 RestAPI를 가져와야함.

  await search(searchKeyword)

  //   console.log(searchKeyword)
  //   console.log(markers)

  await displayMarks()

  //   await ps.keywordSearch(searchKeyword, placesSearchCB)

  // console.log(places)
}
const hovering = (marker, title) => {
  kakao.maps.event.addListener(marker, 'mouseover', function () {
    displayInfowindow(marker, title)
  })

  kakao.maps.event.addListener(marker, 'mouseout', function () {
    infowindow.close()
  })

  itemEl.onmouseover = function () {
    displayInfowindow(marker, title)
  }

  itemEl.onmouseout = function () {
    infowindow.close()
  }
}
const displayMarks = async () => {
  //   var listEl = document.getElementById('placesList')
  var centerPoint = [0, 0]
  // var points = []
  var fragment = document.createDocumentFragment()
  bounds = new kakao.maps.LatLngBounds()
  itemEl = ''
  // console.log(markers)
  markers[0].forEach((now) => {
    // console.log(now)
    // 마커를 생성합니다.
    // TODO 중심으로 가는 코드를 만들어야겠다.

    // centerPoint[0] += now.spotLatitude
    // centerPoint[1] += now.spotLongitude

    // console.log(now.spotLatitude)
    // console.log(now.spotTitle)
    const marker = new kakao.maps.Marker({
      map: map,
      position: new kakao.maps.LatLng(now.spotLatitude, now.spotLongitude)
      // title: now.spotTitle,
      // id: now.spotContentId
    })
    // #TODO 한겹 더 쌓자

    // console.log(marker.title)
    // console.log(kakao.maps.LatLng(now.spotLatitude, now.spotLongitude))
    // console.log(marker)
    marker.title = now.spotTitle
    marker.id = now.spotContentId
    // console.log(marker.title)
    console.log('Aaaaa')
    points.value.push(marker)

    // console.log(points)
    points.value.forEach((e) => {
      console.log(e, e.title)
    })
    console.log(points.value[0].title)

    // console.log(points.value[0].title)
    // console.log(points)
    // 마커가 지도 위에 표시되도록 설정합니다.
    // console.log(marker)
    marker.setMap(map)
    itemEl += getListItem(index++, now)
    // console.log(itemEl)
    bounds.extend(new kakao.maps.LatLng(now.spotLatitude, now.spotLongitude))
  })
  map.setBounds(bounds)
  // console.log(infowindow)
}

// 검색기능
const placesSearchCB = (data, status, pagination) => {
  if (status === kakao.maps.services.Status.OK) {
    places.value = data
    console.log(data)

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x)

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
      map: map,
      position: coords
    })

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
      content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
    })
    infowindow.open(map, marker)

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords)

    // markerPositions = data.
  } else {
    alert('검색 결과가 없습니다.')
  }
}
</script>



<template>
  <div>
    <!-- <div id="map"></div> -->

    <div>
      <input v-model="searchKeyword" @keyup.enter="searchPlaces" placeholder="검색하세요" />
      <ul v-for="place in places" :key="place.id">
        <li>{{ place.place_name }}</li>
      </ul>
      <div id="map" style="width: 100%; height: 400px"></div>
      <!-- TODO v-for를 사용해서 리스트 뽑아내기-->
      <ul v-for="marker in points" :key="marker.id">
        <li v-bind="">
          <span>{{ marker.title }} </span><span>{{ marker.value.title }} </span>
        </li>
      </ul>
      {{ points }}
      <div v-html="itemEl"></div>
    </div>
  </div>
</template>



<style scoped>
#map {
  width: 100%;
  height: 500px;
}

.button-group {
  margin: 10px 0px;
}

button {
  margin: 0 3px;
}
</style>
