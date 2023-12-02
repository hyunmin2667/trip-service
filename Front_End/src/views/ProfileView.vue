<script setup>
import profilePlan from '@/components/profilePlan.vue'
import profilePlace from '@/components/profilePlace.vue'

import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import axios from 'axios'


const router = useRouter()

// Data
const isMyProfile = ref(false)

const userInfo = reactive({
  userId: '',
  profileImage: '/img/noprofile.png',
  name: '',
  followerCount: 0,
  followingCount: 0,
});

const userPlanInfo = reactive({
  thumbnailImage: '',
  planStartDate: null,
  planEndDate: null,
  planTitle: '',
  placeNameList: [],
  placeCount: 0,
  postCount: 0
})

const userPlaceInfo = reactive({
  thumbnailImage: '',
  date: null,
  placeName: '',
})

const profilePlanList = ref([])
const profilePlaceList = ref([]);



const list = async () => {
  try {
    let { data } = await axios.get('http://localhost:8080/freeboard')
    // ngrok로 연결할 때는 header 추가 해야됩니다.
    // let { data } = await axios.get('https://9151-61-253-74-66.ngrok-free.app/freeboard', {
    //   headers: {
    //       'Content-Type': `application/json`,
    //       'ngrok-skip-browser-warning': '69420',
    //     },
    // })
    console.log(data)
    profilePlanList.value = data
    console.log(profilePlanList)
  } catch (error) {
    console.error(error)
  }
}
list()


const boardDetail = async (boardId) => {
  try {
    router.push({
      name: 'BoardDetail',
      query: { boardId: boardId }
    })
    console.log(router)
    // console.log(board)
  } catch (error) {
    console.error(error)
  }
}
</script>

<template>
  <div class="navbarSpace"></div>

  <!-- Header (프로필 상세) -->
  <div class="header">
    <div class="profile-info container">

      <div class="row">

        <div class="col">
          <div class="profile-image">
            <img :src=userInfo.profileImage alt="프로필 이미지">
          </div>
            프로필이미지 : {{ userInfo.profileImage }}
            이름 : {{ userInfo.name }}
        </div>
        <div class="col">
          <div class="contaier ">
            <div class="row align-center">
              팔로워 : {{ userInfo.followerCount }}
              팔로잉 : {{ userInfo.followingCount }}
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>

  <!-- section (여행 및 장소 게시물) -->
  <section class="page-section container" id="board">

    <!-- Plan, Place 토글 버튼 -->
    <div class="plan-place-toggle">
      <div></div>
      <div :class="{ select: profilePlaceList }" class="toggle" @click="profilePlaceList = true">
        PLAN
      </div>
      <div :class="{ select: !profilePlaceList }" class="toggle" @click="profilePlaceList = false">
        PLACE
      </div>
      <div class="dot"></div>
    </div>

    <!-- 토글로 선택된 콘텐츠 -->
    <profile-plan v-if="profilePlaceList" :board-list="profilePlanList" @board-detail="boardDetail"></profile-plan>
    <profile-place v-else :board-list="profilePlanList" @board-detail="boardDetail"></profile-place>

  </section>
</template>



<style scoped>
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

.page-section {
  padding: 4rem 0;
}

.header {
  padding: 4rem 0;
  background: #f4623a;
  color: white;
  font-size: 30px;
}


.profile-image {
  height: 200px;
  width: 200px;
  border-radius: 50%;
  overflow: hidden;
}

.profile-image img {
  height: 100%;
  width: 100%;
  object-fit: cover;
}


/* 토글 CSS 및 Animation */
.plan-place-toggle {
  display: flex;
  margin-bottom: 20px;
  justify-content: start;
}

.toggle {
  font-size: 20px;
  margin: 0px 10px;
  color: #c0c0c0;
  cursor: pointer;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.toggle:hover {
  color: #000000;
}

.toggle.select {
  color: #000000;
}
</style>