<script setup>
import profilePlan from '@/components/profilePlan.vue'
import profilePlace from '@/components/profilePlace.vue'

import { ref, reactive } from 'vue'
import { useRouter } from 'vue-router'
import http from "@/common/axios.js";

const router = useRouter()

// Data
const isMyProfile = ref(false)
const postList = ref([])

const userInfo = reactive({
  profileImage: '/img/noprofile.png',
  userId: '1',
  name: '현민!!'
});
const postInfo = reactive({
  postImageList: ['/img/noprofile.png'],
  placeId: '1',
  placeName: '대방디엠시티',
  postId: '1',
  postTitle: '게시물 타이틀입니다',
  postContent: '게시물 내용입니다.게시물 내용입니다.게시물 내용입니다.게시물 내용입니다.',
  likeCount: 45,
})

const profilePlanList = ref([])
const profilePlaceList = ref([]);

const boardList = async () => {
  let params = {
    leftLatitude: 34,
    rightLatitude: 36,
    leftLongitude: 120,
    rightLongitude: 130
  };

  try {
    // params: params shorthand property, let response 도 제거
    
    let { data } = await http.get("/attractions", { params });
    console.log("boardStore: data : ");
    console.log(data);
    if (data.result == "login") {
      router.push("/login");
    } else {
      setBoardList(data.list);
      setTotalListItemCount(data.count);
    }
  } catch (error) {
    console.error(error);
  }
}

boardList()
</script>

<template>
  <div class="navbarSpace"></div>

  <!-- Header () -->
  <div class="header">
    PostView
  </div>

  <!-- section (게시물 상세) -->
  <section class="page-section container" id="board">
    <div class="row">
      <div class="col">
        사진 : {{ postInfo.postImageList[0] }} <br>
        장소명 : {{ postInfo.placeName }} <br>
        제목 : {{ postInfo.postTitle }} <br>
        내용 : {{ postInfo.postContent }} <br>
        작성자정보 : userId({{ userInfo.userId }}), 사진({{ userInfo.profileImage }}, 이름({{ userInfo.name }})) <br>
        좋아요 수 : {{ postInfo.likeCount }} <br>
      </div>
    </div>

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