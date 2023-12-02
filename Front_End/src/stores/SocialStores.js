import { ref, reactive } from 'vue'
import { defineStore } from 'pinia'

export const useSocialStore = defineStore('socialStore', () => {
  const socialStore = reactive({
    // detail, update, delete
    /* 
    게시물 아이디, 게시물 제목, 게시물 내용
    사용자 이름, 장소 아이디, 장소 좌표, 이름
    */
    postId: 0,
    postTitle: '',
    postContent: '',

    userName: '',
    travelPlaceId: 0,
    imageList: [],
    sameUser: false
  })
  return { socialStore }
})
